import 'package:flutter/material.dart';
import 'package:notemaker/screens/notelist.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Note Banam',
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.amber), fontFamily: 'Indie'),
        debugShowCheckedModeBanner: false,
        home: NoteList());
  }
}
