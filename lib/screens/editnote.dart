import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  int index;
  Function udpateBtn;
  String editTitle;
  String editDesc;

  EditNote(this.index, this.editTitle, this.editDesc, this.udpateBtn);

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  var title;
  var desc;
  var titleData;
  // void submitted() {

  @override
  void initState() {
    title = TextEditingController(
      text: '${widget.editTitle}',
    );

    desc = TextEditingController(
      text: '${widget.editDesc}',
    );
    super.initState();
  }

  // }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    desc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          titleData == null ? '${widget.editTitle}' : titleData,
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
                onChanged: (value) {
                  setState(() {
                    titleData = value;
                  });
                },
                controller: title,
                decoration: InputDecoration(hintText: "Add title"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: desc,
                decoration: InputDecoration(hintText: "Add description"),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      onPressed: () {
                        if (title.text.isEmpty) {
                          setState(() {
                            title.text = widget.editTitle;
                          });
                        } else if (desc.text.isEmpty) {
                          desc.text = widget.editDesc;
                        }
                        widget.udpateBtn(title.text, desc.text, widget.index);
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Text('Update')))
            ],
          ),
        ),
      ),
    );
  }
}
