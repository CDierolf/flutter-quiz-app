import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List _questions;
  final int _questionIndex;
  final Function _answerQuestion;
  const Quiz(this._questions, this._questionIndex, this._answerQuestion,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          _questions[_questionIndex]['questionText'] as String,
        ),
        ...(_questions[_questionIndex]['questionAnswers']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => _answerQuestion(answer['score'] as int),
              answer['text'] as String);
        }).toList()
      ],
    );
  }
}
