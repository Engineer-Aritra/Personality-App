import 'package:flutter/material.dart';
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
  var _questions = [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 4},
        {'text': 'green', 'score': 6},
        {'text': 'White', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 4},
        {'text': 'Elephant', 'score': 6},
        {'text': 'Lion', 'score': 10}
      ]
    },
    {
      'questionText': 'Which is your favourite Food?',
      'answers': [
        {'text': 'Pizza', 'score': 1},
        {'text': 'Burger', 'score': 4},
        {'text': 'Biryani', 'score': 6},
        {'text': 'Fruit Juice', 'score': 10},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!. Score so far is $_totalscore');
    } else {
      print('Questions not found! Score Generated $_totalscore');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Personality Test App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalscore, _resetQuiz),
    ));
  }
}
