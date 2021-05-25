import 'package:flutter/material.dart';
import 'package:udemy_guide/answer.dart';
import 'package:udemy_guide/question.dart';
import 'package:udemy_guide/quiz.dart';
import 'package:udemy_guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var total = 0;
  // This widget is the root of your application.
  var questionIndex = 0;
  var answerIndex = 0;
  var questions = [
    {
      'question': 'Qn1. What\s the capital city of Nepal?',
      'answer': [
        {'name': 'Pokhara', 'score': 0},
        {'name': 'Kathmandu', 'score': 1}
      ]
    },
    {
      'question': 'Qn2. What\s the height of Mt.Everet?',
      'answer': [
        {'name': '8848', 'score': 1},
        {'name': '8856', 'score': 0}
      ]
    },
    {
      'question': 'Qn3. Who won the fifal world cup in 2018?',
      'answer': [
        {'name': 'France', 'score': 1},
        {'name': 'Germany', 'score': 0}
      ]
    },
  ];

  // var answers = [
  //   ['Pokhara', 'kathmandu'],
  //   ['8848', '8856'],
  //   ['France', 'Germany']
  // ];
  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      total = 0;
    });
  }

  void answerQuestion(int score) {
    if (questionIndex > questions.length) {
      setState(() {});
    } else {
      setState(() {
        questionIndex = questionIndex + 1;
        total = total + score;
        print(
            'Question Index:${questionIndex} and length: ${questions.length}');
        // answerIndex = answerIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Quiz App'),
            ),
            body: questionIndex < questions.length
                ? Quiz(answerQuestion, questions, questionIndex, total)
                : Result(resetQuiz, total)));
  }
}
