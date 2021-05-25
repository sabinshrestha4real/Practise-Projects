import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Function answerQuestion;
  var total;
  Result(this.answerQuestion, this.total);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Your total score: ${total}'),
        ),
        RaisedButton(
          onPressed: answerQuestion,
          child: Text('Reset'),
        )
      ],
    );
  }
}
