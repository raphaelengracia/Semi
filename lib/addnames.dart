import 'package:flutter/material.dart';

class Addname extends StatefulWidget {
  final Map? addname;
  const Addname({super.key, this.addname});

  @override
  State<Addname> createState() => _AddnameState();
}

class _AddnameState extends State<Addname> {
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final todo = widget.addname;
    if (todo != null) {
      final title = todo['title'];
      titleController.text = title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add name'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Add Name Here'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: submit,
              child: Text('Add names'))
        ],
      ),
    );
  }

  Future <void> submit() async {
    //Get the data
    final title = titleController.text;
    final body = {
      'title': title,
      'is completed': false,
    };
  }
}

