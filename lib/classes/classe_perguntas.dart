import 'package:flutter/material.dart';
import 'package:projetopaginatriagem/pages/pageViews/result.dart';
import '../../classes/Gestor.dart';

// ----------------------------------------------------------------------
// CLASSE PARA GERENCIAR PERGUNTAS DA TRIAGEM E EXIBIÇAO DO TOGGLE BUTTON
// ----------------------------------------------------------------------

class YesNoQuestions extends StatefulWidget {
  final Gestor Ref_Gestao = Gestor();
  @override
  _YesNoQuestionsState createState() => _YesNoQuestionsState();
}

class _YesNoQuestionsState extends State<YesNoQuestions> {
  bool q1 = false;
  bool q2 = false;
  bool q3 = false;
  bool q4 = false;
  bool q5 = false;
  bool q6 = false;
  bool q7 = false;
  bool q8 = false;
  bool q9 = false;
  bool q10 = false;
  bool q11 = false;
  bool q12 = false;
  bool q13 = false;
  bool q14 = false;
  bool q15 = false;

  @override
  Widget build(BuildContext context) {
    widget.Ref_Gestao.triagem();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: widget.Ref_Gestao.box,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40),
                  Text(
                    widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_TITULO"),
                    style: TextStyle(color: Colors.white, fontSize: 27),
                  ),
                  SizedBox(height: 25),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_1"),
                      q1, (value) {
                    setState(() {
                      q1 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_2"),
                      q2, (value) {
                    setState(() {
                      q2 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_3"),
                      q3, (value) {
                    setState(() {
                      q3 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_4"),
                      q4, (value) {
                    setState(() {
                      q4 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_5"),
                      q5, (value) {
                    setState(() {
                      q5 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_6"),
                      q6, (value) {
                    setState(() {
                      q6 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_7"),
                      q7, (value) {
                    setState(() {
                      q7 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_8"),
                      q8, (value) {
                    setState(() {
                      q8 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_9"),
                      q9, (value) {
                    setState(() {
                      q9 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_10"),
                      q10, (value) {
                    setState(() {
                      q10 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_11"),
                      q11, (value) {
                    setState(() {
                      q11 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_12"),
                      q12, (value) {
                    setState(() {
                      q12 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_13"),
                      q13, (value) {
                    setState(() {
                      q13 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_14"),
                      q14, (value) {
                    setState(() {
                      q14 = value;
                    });
                  }),
                  QuestionWidget(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_CAMPO_15"),
                      q15, (value) {
                    setState(() {
                      q15 = value;
                    });
                  }),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            answers: [
                              q1,
                              q2,
                              q3,
                              q4,
                              q5,
                              q6,
                              q7,
                              q8,
                              q9,
                              q10,
                              q11,
                              q12,
                              q13,
                              q14,
                              q15
                            ],
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: widget.Ref_Gestao.textColor.withOpacity(0.5)),
                    child: Text(
                      widget.Ref_Gestao.get_definicao("PAGE_TRIAGEM_BTN"),
                      style: TextStyle(color: widget.Ref_Gestao.textColor),
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String question;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Gestor Ref_Gestao = Gestor();

  QuestionWidget(this.question, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) {
    this.Ref_Gestao.triagem();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              question,
              style: TextStyle(color: this.Ref_Gestao.textColor),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: this.Ref_Gestao.textColor,
          ),
        ],
      ),
    );
  }
}
