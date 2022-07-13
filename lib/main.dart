import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

/* void main() {
  runApp(MyApp());
} */

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // binding with MyAppState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "what's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': "what's your favorite animal?",
      'answers': [
        {'text': 'Wolf', 'score': 3},
        {'text': 'Hawk', 'score': 11},
        {'text': 'Dragon', 'score': 15},
        {'text': 'Lion', 'score': 9},
      ]
    },
    {
      'questionText': "what's your favorite movie?",
      'answers': [
        {'text': 'Old', 'score': 9},
        {'text': 'Run', 'score': 10},
        {'text': 'Saw', 'score': 6},
        {'text': 'The House', 'score': 7},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      this._questionIndex = 0;
      this._totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    this._totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print('answer 1 chosen!');
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  Widget build(BuildContext context) {
    // implémentation de statelessWidget
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
