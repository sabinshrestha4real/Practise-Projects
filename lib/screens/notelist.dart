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
  List<NoteModel> notelist = [];

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
      setState(() {
        notelist.clear();
        var noteList = contain.docs;
        noteList.forEach((element) {
          notelist.add(NoteModel(
            title: element["title"],
            desc: element["description"],
          ));
        });

        // notelist.map((e) => e.title.toSet().toList());
      });
    });
  }

  void deleteData(index) async {
    setState(() {
      notelist.removeAt(index);
    });
    CollectionReference _removeData =
        FirebaseFirestore.instance.collection("data");
    QuerySnapshot querySnapshot = await _removeData.get();
    querySnapshot.docs[index].reference.delete();
  }

  void addData(title, desc) {
    Map<String, dynamic> firedata = {
      "title": title,
      "description": desc,
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("data");
    collectionReference.add(firedata);
  }

  void updateData(updatetitle, updatedesc, index) async {
    CollectionReference _updateData =
        FirebaseFirestore.instance.collection("data");
    QuerySnapshot querySnapshot = await _updateData.get();
    querySnapshot.docs[index].reference
        .update({"title": updatetitle, "description": updatedesc});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.yellow[200],
          title: Text(
            'Notes',
            style: TextStyle(color: Colors.black, fontSize: 22.0),
          ),
          // actions: [
          //   IconButton(
          //       splashColor: Colors.transparent,
          //       highlightColor: Colors.transparent,
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.search,
          //         color: Colors.black,
          //         size: 30.0,
          //       ))
          // ],
        ),
        body: notelist.length == 0
            ? Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/notebackground.jpg"),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    'Oops! no any notes',
                    style: TextStyle(color: Colors.grey, fontSize: 20.0),
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/notebackground.jpg"),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    ListView.builder(
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
                            onDismissed: (direction) => deleteData(index),
                            key: UniqueKey(),
                            child: Column(
                              children: [
                                Card(
                                  elevation: 7.0,
                                  shadowColor: Colors.blue[200],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditNote(
                                                  index,
                                                  notelist[index].title,
                                                  notelist[index].desc,
                                                  updateData)));
                                    },
                                    title: Text(notelist[index].title),
                                    subtitle: Text(notelist[index].desc),
                                    trailing: IconButton(
                                        onPressed: () => deleteData(index),
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
                  ],
                ),
              ),
        bottomNavigationBar: ButtonTheme(
          height: MediaQuery.of(context).size.height / 15,
          minWidth: double.infinity,
          child: Container(
            color: Colors.yellow[200],
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
                    icon: Icon(Icons.add))
              ],
            ),
          ),
        ));
  }
}
