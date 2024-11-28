import 'package:flutter/material.dart';
import '../../classes/Paciente.dart';
import '../../classes/Database.dart';
import '../../classes/Gestor.dart';
import 'package:projetopaginatriagem/pages/home_page.dart';

class ResultPage extends StatelessWidget {
  final List<bool> answers;
  final Gestor Ref_Gestao = Gestor();

  ResultPage({
    required this.answers,
  });

  void getStatus() {
    this.Ref_Gestao.diagnostico();

    int count = answers.where((answer) => answer).length;

    if (count > 12) {
      return Paciente.setDiagnostico(novoDiagnostico: this.Ref_Gestao.get_definicao("PAGE_DIAGNOSTICO_1"));
    } else if (count > 9) {
      return Paciente.setDiagnostico(novoDiagnostico: this.Ref_Gestao.get_definicao("PAGE_DIAGNOSTICO_2"));
    } else if (count > 6) {
      return Paciente.setDiagnostico(novoDiagnostico: this.Ref_Gestao.get_definicao("PAGE_DIAGNOSTICO_3"));
    } else if (count > 3) {
      return Paciente.setDiagnostico(novoDiagnostico: this.Ref_Gestao.get_definicao("PAGE_DIAGNOSTICO_4"));
    } else {
      return Paciente.setDiagnostico(novoDiagnostico: this.Ref_Gestao.get_definicao("PAGE_DIAGNOSTICO_5"));
    }
  }

  Color getBackgroundColor() {
    int count = answers.where((answer) => answer).length;

    if (count > 12) {
      return Colors.red; // Cor para 'Emergência'
    } else if (count > 9) {
      return Colors.orange; // Cor para 'Urgência'
    } else if (count > 6) {
      return Colors.yellow; // Cor para 'Semiurgência'
    } else if (count > 3) {
      return Colors.blue; // Cor para 'Pouco Urgente'
    } else {
      return Colors.green; // Cor para 'Não Urgente'
    }
  }

  @override
  Widget build(BuildContext context) {

    final databaseConnection = DatabaseConnection();
    getStatus();
    databaseConnection.salvarPacienteNoDB(
        novoNome: Paciente.nome,
        novoSobrenome: Paciente.sobrenome,
        novoUtente: Paciente.utente,
        novoGenero: Paciente.genero,
        novaIdade: Paciente.idade,
        novoPeso: Paciente.peso,
        novaAltura: Paciente.altura,
        novoContacto: Paciente.contacto,
        novoDiagnotico: Paciente.diagnostico);

    return WillPopScope(
        onWillPop: () async {
      // Use Navigator para ir diretamente para a primeira página
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );

      // Indica que a navegação será tratada manualmente
      return false;
    },
    child: Scaffold(
    appBar: AppBar(
    backgroundColor: this.Ref_Gestao.backgroundColor,
    title: Text(
    this.Ref_Gestao.get_definicao("PAGE_DIAGNOSTICO_FINAL_1"),
    style: TextStyle(color: this.Ref_Gestao.textColor, fontSize: this.Ref_Gestao.fontSize),
    ),
    ),
      body: Container(
        color: getBackgroundColor(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: this.Ref_Gestao.textColor, // Cor do retângulo branco
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // Borda arredondada
                ),
                padding: EdgeInsets.all(16.0), // Preenchimento interno
                child: Column(
                  children: [
                    Text(
                      this.Ref_Gestao.get_definicao("PAGE_DIAGNOSTICO_FINAL_2"),
                      style: TextStyle(
                        fontSize: this.Ref_Gestao.fontSize2,
                        fontWeight: this.Ref_Gestao.fontWeight,
                        color: this.Ref_Gestao.textColor2,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      Paciente.diagnostico,
                      style: TextStyle(fontSize: this.Ref_Gestao.fontSize, color: this.Ref_Gestao.textColor2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
