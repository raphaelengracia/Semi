import 'addnames.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List items = [];

  @override
  void initState() {
    super.initState();
    GetNames();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('List of Names',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index] as Map;
            final id = item ['_id'] as String;
            return ListTile(
              title: Text(item['title']),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: ToAddName,
            label: Text("Add Name")
        )
    );
  }

  Future<void> ToAddName() async {
    final route = MaterialPageRoute(
        builder: (context) => Addname()
    );
    await Navigator.push(context, route);
  }

  Future<void> GetNames() async {
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState() {
        items = result;
      }
    }
  }
}


