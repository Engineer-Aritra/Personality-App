import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = "You did it";
    if (resultScore <= 8) {
      resultText = "You are pretty aweful";
    } else if (resultScore <= 12) {
      resultText = "You are meh!";
    } else if (resultScore <= 16) {
      resultText = "You seem fine";
    } else if (resultScore <= 24) {
      resultText = "You are awesome and innocent";
    } else {
      resultText = "You are the best!!";
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
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 24),
            ),
            //textColor: Colors.black,
            //color: Colors.amber,
          )
        ],
      ),
    );
  }
}
