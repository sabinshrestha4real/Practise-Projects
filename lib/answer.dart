import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
  final Function answerText;
  final String answer;
  Answer(this.answerText, this.answer);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: answerText, child: Text(answer));
  }
}
