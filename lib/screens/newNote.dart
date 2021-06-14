import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  Function btnpress;

  NewNote(this.btnpress);
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final snackBar = SnackBar(content: Text('Baka! You missed title'));

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  void submitted() {
    if (title.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    widget.btnpress(title.text, desc.text);
    Navigator.pop(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Add Note',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              TextFormField(
                controller: title,
                decoration: InputDecoration(hintText: "Title"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: desc,
                decoration: InputDecoration(hintText: "Description"),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      onPressed: submitted,
                      child: Text('Save')))
            ],
          ),
        ),
      ),
    );
  }
}
