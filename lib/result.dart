import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  VoidCallback _resetQuiz;
  Result(this._totalScore, this._resetQuiz, {Key? key}) : super(key: key);

  String get resultPhrase {
    String resultText = 'You did it!';
    if (_totalScore <= 8) {
      resultText = 'You suck';
    } else if (_totalScore > 8 && _totalScore <= 30) {
      resultText = 'Not too bad';
    } else if (_totalScore > 30) {
      resultText = 'Fan freakin tastic!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Reset',
            ),
            textColor: Colors.blue,
            onPressed: _resetQuiz,
          )
        ],
      ),
    );
  }
}
