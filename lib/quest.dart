import 'package:flutter/material.dart';
import './question.dart';
import './responds.dart';

class Quest extends StatelessWidget {
  final List<Map<String, Object>> perguntas; 
  final int perguntasSel;

  final void Function(int) onRespond;

  Quest({
    required this.perguntas,
    required this.perguntasSel,
    required this.onRespond,
  });

  bool get isSelected {
    return perguntasSel < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> resp = isSelected ? perguntas[perguntasSel].cast()['responds'] : [];


    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        Question(perguntas[perguntasSel]['text'].toString()),
        ...resp.map((resp) {
          return Responds(
            resp['text'].toString(), () => onRespond(int.parse(resp['assessment'].toString()))
          );
        }).toList(),
      ],
    );
  }
}
