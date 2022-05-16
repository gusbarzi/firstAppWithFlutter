// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Responds extends StatelessWidget {
  final String text;
  final void Function() onSelection;

  Responds(this.text, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(text),
        onPressed: onSelection,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}