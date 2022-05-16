// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './result.dart';
import './quest.dart';

void main() => runApp(const QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _perguntasSel = 0;
  var _assessment = 0;
  final _perguntas = const [
    {
      'text': 'What my favorite color is?',
      'responds': [
        {'text': 'Black', 'assessment': 10},
        {'text': 'Red', 'assessment': 5},
        {'text': 'Green', 'assessment': 4},
        {'text': 'Yellow', 'assessment': 2},
      ],
    },
    {
      'text': 'What my favorite animal is?',
      'responds': [
        {'text': 'Lion', 'assessment': 10},
        {'text': 'Fox', 'assessment': 5},
        {'text': 'Crocodile', 'assessment': 4},
        {'text': 'Bear', 'assessment': 2},
      ],
    },
    {
      'text': 'What my favorite soccer team?',
      'responds': [
        {'text': 'Barcelona', 'assessment': 10},
        {'text': 'Real Madrid', 'assessment': 5},
        {'text': 'Paris Saint German', 'assessment': 4},
        {'text': 'Manchester United', 'assessment': 2},
      ],
    },
  ];

  void _respond(int assessment) {
    if (isSelected) {
      setState(() {
        _perguntasSel++;
        _assessment += assessment;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _perguntasSel = 0;
      _assessment = 0;
    });
  }

  bool get isSelected {
    return _perguntasSel < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: isSelected
            ? Quest(
                perguntas: _perguntas,
                perguntasSel: _perguntasSel,
                onRespond: _respond,
              )
            : Result(_assessment, _restartQuiz),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
