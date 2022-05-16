import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  
  final int assessment;
  final void Function() onRestartQuest;

  Result(this.assessment, this.onRestartQuest);

  String get phaseResult {
    if(assessment < 8) {
      return 'Cool!';
    } else if (assessment < 12) {
      return 'You are good!';
    } else if (assessment < 16) {
      return 'Awesome!';
    } else {
      return 'OMG! You are the best!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center (
          child: Text(
            phaseResult,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          child: const Text(
            'Restart',
            style: TextStyle(fontSize: 18),
            ),
          onPressed: onRestartQuest,
           ),
      ],
    );
  }
}