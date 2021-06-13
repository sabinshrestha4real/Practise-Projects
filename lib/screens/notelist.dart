import 'package:flutter/material.dart';
import 'package:notemaker/models/noteModel.dart';
import 'package:notemaker/screens/editnote.dart';
import 'package:notemaker/screens/newNote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  void initState() {
    // TODO: implement initState
    fetchdata();
    super.initState();
  }

  void fetchdata() {
    CollectionReference _collectionReference =
        FirebaseFirestore.instance.collection("data");
    _collectionReference.snapshots().listen((contain) {
      List noteList = [];
      setState(() {
        noteList = contain.docs;
        noteList.forEach((element) {
          notelist.add(NoteModel(
            title: element["title"],
            desc: element["desc"],
          ));
        });

        // notelist.map((e) => e.title.toSet().toList());
      });
    });
  }

  void addData(title, desc) {
    Map<String, dynamic> firedata = {
      "title": title,
      "description": desc,
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("data");
    collectionReference.add(firedata);

    // var store = NoteModel(title: title, desc: desc);
    // setState(() {
    //   notelist.add(store);
    // });
  }

  List<NoteModel> notelist = [
    // NoteModel(
    //     title: 'First Note',
    //     desc: 'This is my first note',
    //     date: DateTime.now()),
    // NoteModel(
    //     title: 'Second Note',
    //     desc: 'This is my second note',
    //     date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'Notes',
            style: TextStyle(color: Colors.black, fontSize: 22.0),
          ),
          actions: [
            IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30.0,
                ))
          ],
        ),
        body: notelist.length == 0
            ? Center(
                child: Text(
                  'Oops! no any notes',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: notelist.length,
                itemBuilder: (BuildContext context, index) {
                  return Dismissible(
                    background: Container(
                      padding: EdgeInsets.only(right: 18.0),
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                      color: Colors.red,
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) {
                      setState(() {
                        notelist.removeAt(index);
                      });
                    },
                    key: UniqueKey(),
                    child: Column(
                      children: [
                        Card(
                          shadowColor: Colors.blue[200],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditNote(
                                          notelist[index].title,
                                          notelist[index].desc)));
                            },
                            title: Text(notelist[index].title),
                            subtitle: Text(notelist[index].desc),
                            trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    notelist.removeAt(index);
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
        bottomNavigationBar: ButtonTheme(
          height: MediaQuery.of(context).size.height / 15,
          minWidth: double.infinity,
          child: Container(
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('')),
                Expanded(child: Text(() {
                  if (notelist.length == 0) {
                    return '';
                  } else
                    return 'Notes: ${notelist.length}';
                }())),
                IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    iconSize: MediaQuery.of(context).size.height / 25,
                    color: Colors.orange,
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewNote(
                                    addData,
                                  )),
                        ),
                    icon: Icon(Icons.note_alt_outlined))
              ],
            ),
          ),
        ));
  }
}
