import 'package:flutter/material.dart';
import 'package:udemy_guide/answer.dart';
import 'package:udemy_guide/question.dart';

class Quiz extends StatelessWidget {
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  List<Map<String, Object>> questions;
  Function answerQuestion;
  var total;
  var questionIndex;
  Quiz(this.answerQuestion, this.questions, this.questionIndex, this.total);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Question(questions[questionIndex]['question']),
          SizedBox(
            height: 10.0,
          ),
          ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
              .map((e) {
            return Answer(() => answerQuestion(e['score']), e['name']);
          }).toList(),

          Text('Your score: ${total}')
          // Answer(answerQuestion),
        ],
      ),
    );
  }
}
