import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'questionAnswers': [
        {'text': 'Red', 'score': 1},
        {'text': 'Green', 'score': 5},
        {'text': 'Yellow', 'score': 3}
      ]
    },
    {
      'questionText': "What's your favorite animal?",
      'questionAnswers': [
        {'text': 'Monkey', 'score': 1},
        {'text': 'Robin', 'score': 35},
        {'text': 'Snek', 'score': 12},
        {'text': 'Dog', 'score': 13}
      ]
    },
    {
      'questionText': "Who's your favorite person?",
      'questionAnswers': [
        {'text': 'Wendy', 'score': 1},
        {'text': 'Saul Goodman', 'score': 10},
        {'text': 'Heisenburg', 'score': 100},
        {'text': 'Jimmy McGill', 'score': 50}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My Quiz App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(_questions, _questionIndex, _answerQuestion)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
