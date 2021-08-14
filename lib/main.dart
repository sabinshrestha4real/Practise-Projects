import 'package:corona_app/model/model.dart';
import 'package:corona_app/model/provider.dart';
import 'package:corona_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FetchAPI(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0xff8FB8F0))),
        title: 'Corona App',
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
        },
      ),
    );
  }
}
