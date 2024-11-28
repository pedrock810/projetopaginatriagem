import 'package:flutter/material.dart';
import '../../classes/classe_perguntas.dart';
import '../../classes/Paciente.dart';
import '../../classes/Gestor.dart';

class RegistoPacientePage extends StatefulWidget {
  RegistoPacientePage({Key? key}) : super(key: key);
  final Gestor Ref_Gestao = Gestor();
  @override
  _RegistoPacientePageState createState() => _RegistoPacientePageState();
}

class _RegistoPacientePageState extends State<RegistoPacientePage> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  late TextEditingController nomeController;
  late TextEditingController sobrenomeController;
  late TextEditingController utenteController;
  late TextEditingController generoController;
  late TextEditingController idadeController;
  late TextEditingController pesoController;
  late TextEditingController alturaController;
  late TextEditingController contactoController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);

    // Inicializar os controllers
    nomeController = TextEditingController();
    sobrenomeController = TextEditingController();
    utenteController = TextEditingController();
    generoController = TextEditingController();
    idadeController = TextEditingController();
    pesoController = TextEditingController();
    alturaController = TextEditingController();
    contactoController = TextEditingController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    // Dispose dos controllers
    nomeController.dispose();
    sobrenomeController.dispose();
    utenteController.dispose();
    generoController.dispose();
    idadeController.dispose();
    pesoController.dispose();
    alturaController.dispose();
    contactoController.dispose();

    super.dispose();
  }

  void navigateToNextPage() {
    // Passa os valores dos controllers para o método setDadosPaciente
    Paciente.setDadosPaciente(
      novoNome: nomeController.text,
      novoSobrenome: sobrenomeController.text,
      novoUtente: utenteController.text,
      novoGenero: generoController.text,
      novaIdade: idadeController.text,
      novoPeso: pesoController.text,
      novaAltura: alturaController.text,
      novoContacto: contactoController.text,
    );

    if (_currentPageIndex < 1) {
      _currentPageIndex++;
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.Ref_Gestao.registoTriagem();

    return Scaffold(
      backgroundColor: widget.Ref_Gestao.backgroundColor,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.Ref_Gestao.get_definicao("PAGE_REGISTOTRIAGEM_TITULO"),
                          style: TextStyle(
                            color: widget.Ref_Gestao.textColor,
                            fontSize: widget.Ref_Gestao.fontSize,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: TextField(
                        controller: nomeController,
                        style: TextStyle(color: widget.Ref_Gestao.textColor),
                        decoration: InputDecoration(
                          hintText: widget.Ref_Gestao.get_definicao("PAGE_REGISTOTRIAGEM_CAMPO_1"),
                          hintStyle: TextStyle(color: widget.Ref_Gestao.textColor),
                          prefixIcon: Icon(
                            Icons.person,
                            color: widget.Ref_Gestao.textColor,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 50),
                    Expanded(
                      child: TextField(
                        controller: sobrenomeController,
                        style: TextStyle(
                            color: widget.Ref_Gestao.textColor),
                        decoration: InputDecoration(
                          hintText: widget.Ref_Gestao.get_definicao("PAGE_REGISTOTRIAGEM_CAMPO_2"),
                          hintStyle: TextStyle(
                              color: widget.Ref_Gestao.textColor),
                          prefixIcon: Icon(
                            Icons.person,
                            color: widget.Ref_Gestao.textColor,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10), // Ajusta o espaçamento em torno do ícone
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                SizedBox(
                    height: 20), // Adiciona um espaçamento vertical entre os inputs
                Row(
                  children: [
                    SizedBox(width: 50),
                    Expanded(
                      child: TextField(
                        controller: utenteController,
                        style: TextStyle(
                            color: widget.Ref_Gestao.textColor),
                        decoration: InputDecoration(
                          hintText: widget.Ref_Gestao.get_definicao("PAGE_REGISTOTRIAGEM_CAMPO_3"),
                          hintStyle: TextStyle(
                              color: widget.Ref_Gestao.textColor),
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: widget.Ref_Gestao.textColor, // Define a cor do ícone como branca
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10), // Ajusta o espaçamento em torno do ícone
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                SizedBox(
                    height: 20), // Adiciona um espaçamento vertical entre os inputs
                Row(
                  children: [
                    SizedBox(width: 50),
                    Expanded(
                      child: TextField(
                        controller: generoController,
                        style: TextStyle(
                            color: widget.Ref_Gestao.textColor), // Altera a cor do texto para branco
                        decoration: InputDecoration(
                          hintText: widget.Ref_Gestao.get_definicao("PAGE_REGISTOTRIAGEM_CAMPO_4"),
                          hintStyle: TextStyle(
                              color: widget.Ref_Gestao.textColor), // Altera a cor do texto do placeholder para branco
                          prefixIcon: Icon(
                            Icons.wc,
                            color: widget.Ref_Gestao.textColor, // Define a cor do ícone como branca
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10), // Ajusta o espaçamento em torno do ícone
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                SizedBox(
                    height: 20), // Adiciona um espaçamento vertical entre os inputs
                Row(
                  children: [
                    SizedBox(width: 50),
                    Expanded(
                      child: TextField(
                        controller: idadeController,
                        style: TextStyle(
                            color: widget.Ref_Gestao.textColor), // Altera a cor do texto para branco
                        decoration: InputDecoration(
                          hintText: widget.Ref_Gestao.get_definicao("PAGE_REGISTOTRIAGEM_CAMPO_5"),
                          hintStyle: TextStyle(
                              color: widget.Ref_Gestao.textColor), // Altera a cor do texto do placeholder para branco
                          prefixIcon: Icon(
                            Icons.event,
                            color: widget.Ref_Gestao.textColor, // Define a cor do ícone como branca
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10), // Ajusta o espaçamento em torno do ícone
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                SizedBox(
                    height: 20), // Adiciona um espaçamento vertical entre os inputs
                Row(
                  children: [
                    SizedBox(width: 50),
                    Expanded(
                      child: TextField(
                        controller: pesoController,
                        style: TextStyle(
                            color: widget.Ref_Gestao.textColor), // Altera a cor do texto para branco
                        decoration: InputDecoration(
                          hintText: widget.Ref_Gestao.get_definicao("PAGE_REGISTOTRIAGEM_CAMPO_6"),
                          hintStyle: TextStyle(
                              color: widget.Ref_Gestao.textColor), // Altera a cor do texto do placeholder para branco
                          prefixIcon: Icon(
                            Icons.fitness_center,
                            color: widget.Ref_Gestao.textColor, // Define a cor do ícone como branca
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10), // Ajusta o espaçamento em torno do ícone
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                SizedBox(
                    height: 20), // Adiciona um espaçamento vertical entre os inputs
                Row(
                  children: [
                    SizedBox(width: 50),
                    Expanded(
                      child: TextField(
                        controller: alturaController,
                        style: TextStyle(
                            color: widget.Ref_Gestao.textColor), // Altera a cor do texto para branco
                        decoration: InputDecoration(
                          hintText: widget.Ref_Gestao.get_definicao("PAGE_REGISTOTRIAGEM_CAMPO_7"),
                          hintStyle: TextStyle(
                              color: widget.Ref_Gestao.textColor), // Altera a cor do texto do placeholder para branco
                          prefixIcon: Icon(
                            Icons.height,
                            color: widget.Ref_Gestao.textColor, // Define a cor do ícone como branca
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10), // Ajusta o espaçamento em torno do ícone
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                SizedBox(
                    height: 20), // Adiciona um espaçamento vertical entre os inputs
                Row(
                  children: [
                    SizedBox(width: 50),
                    Expanded(
                      child: TextField(
                        controller: contactoController,
                        style: TextStyle(
                            color: widget.Ref_Gestao.textColor), // Altera a cor do texto para branco
                        decoration: InputDecoration(
                          hintText: widget.Ref_Gestao.get_definicao("PAGE_REGISTOTRIAGEM_CAMPO_8"),
                          hintStyle: TextStyle(
                              color: widget.Ref_Gestao.textColor), // Altera a cor do texto do placeholder para branco
                          prefixIcon: Icon(
                            Icons.phone,
                            color: widget.Ref_Gestao.textColor, // Define a cor do ícone como branca
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10), // Ajusta o espaçamento em torno do ícone
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),

                Row(
                  children: [
                    SizedBox(width: 50),
                    Expanded(
                      child: ElevatedButton(
                        onPressed:
                            navigateToNextPage, // Chamando a função para mudar para a próxima página
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              widget.Ref_Gestao.textColor.withOpacity(0.5)),
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size.fromHeight(50)),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(
                                  fontSize: widget.Ref_Gestao.fontSize2, fontWeight:  widget.Ref_Gestao.fontWeight)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(widget.Ref_Gestao.textColor),
                        ),
                        child: Text(
                          widget.Ref_Gestao.get_definicao("PAGE_REGISTOTRIAGEM_BTN"),
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          YesNoQuestions(), // Segunda página
        ],
      ),
    );
  }
}
