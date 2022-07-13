import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int scoreResult;
  final Function resetHandler;

  Result(this.scoreResult, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (scoreResult <= 14) {
      resultText = "You are awesome and innocent!";
    } else if (scoreResult <= 16) {
      resultText = "Pretty likeable!";
    } else if (scoreResult <= 20) {
      resultText = "You are ... strange?!";
    } else {
      resultText = "You are so bad :)";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text("Reset Quiz!"),
            style:
                TextButton.styleFrom(primary: Color.fromARGB(255, 131, 51, 45)),
          )
        ],
      ),
    );
  }
}
