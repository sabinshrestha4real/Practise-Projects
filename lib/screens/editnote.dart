import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  String editTitle;
  String editDesc;

  EditNote(this.editTitle, this.editDesc);

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          '${widget.editTitle}',
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
              // TextFormField(
              //   // controller: title,
              //   decoration: InputDecoration(hintText: "${widget.editTitle}"),
              // ),
              // SizedBox(
              //   height: 10.0,
              // ),
              TextFormField(
                // controller: desc,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "${widget.editDesc}"),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Text('Save')))
            ],
          ),
        ),
      ),
    );
  }
}
