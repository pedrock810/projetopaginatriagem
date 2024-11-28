import 'package:flutter/material.dart';
import '../../classes/classe_perguntas.dart';

void main() {
  runApp(MaterialApp(
    home: YesNoQuestions(),
  ));
}

class QuestionWidget extends StatelessWidget {
  final String question;
  final bool value;
  final ValueChanged<bool> onChanged;

  QuestionWidget(this.question, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          question,
          style: TextStyle(color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Não', style: TextStyle(color: Colors.white)),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.green,
            ),
            Text('Sim', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}