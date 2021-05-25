import 'package:assignment/button.dart';
import 'package:assignment/textControl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var click = ["Hellow there", "You clicked!!"];
  var clickIndex = 0;
  // String text = 'Hello there';

  void btn() {
    if (clickIndex == click.length - 1) {
      setState(() {
        clickIndex = 0;
      });
    } else {
      setState(() {
        // text = 'You clicekd';
        clickIndex = clickIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Text'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextDisplay(click[clickIndex]),
            ButtonPress(btn),
          ],
        ),
      ),
    );
  }
}
