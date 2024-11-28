import 'package:flutter/material.dart';
import 'package:projetopaginatriagem/classes/User.dart';
import '../../classes/Database.dart';
import '../../classes/User.dart';
import '../../classes/Gestor.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatefulWidget {
  final Gestor Ref_Gestao = Gestor();
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showPatientList = false;
  List<Map<String, dynamic>> patients = [];

  @override
  Widget build(BuildContext context) {
    widget.Ref_Gestao.perfil();

    return Scaffold(
      backgroundColor: widget.Ref_Gestao.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                widget.Ref_Gestao.get_definicao("PAGE_PERFIL_TITULO"),
                style: TextStyle(
                  color: widget.Ref_Gestao.textColor,
                  fontSize: widget.Ref_Gestao.fontSize,
                ),
              ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.Ref_Gestao.textColor,
                ),
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.person,
                  size: 130,
                  color: widget.Ref_Gestao.textColor2,
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.Ref_Gestao.get_definicao("PAGE_PERFIL_NOME_SOBRENOME"),
                style: TextStyle(
                  fontSize: widget.Ref_Gestao.fontSize2,
                  fontWeight: widget.Ref_Gestao.fontWeight,
                  color: widget.Ref_Gestao.textColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.Ref_Gestao.get_definicao("PAGE_PERFIL_EMAIL"),
                style: TextStyle(
                  fontSize: widget.Ref_Gestao.fontSize3,
                  color: widget.Ref_Gestao.textColor,
                ),
              ),
              SizedBox(height: 60),
              // Seção "Listagem de Pacientes"
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () async {
                    final databaseConnection = DatabaseConnection();
                    List<Map<String, dynamic>> result =
                    await databaseConnection.listarPacientes(User.id);

                    setState(() {
                      patients = result;
                      showPatientList = !showPatientList;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[200], // Cor de fundo cinza claro
                  ),
                  child: Text(widget.Ref_Gestao.get_definicao("PAGE_PERFIL_LISTAGEM"),
                      style: TextStyle(color: widget.Ref_Gestao.textColor2)),
                ),
              ),
              // Lista de Pacientes (Visível apenas quando showPatientList é true)
              Visibility(
                visible: showPatientList,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: widget.Ref_Gestao.textColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: patients.isEmpty
                      ? Center(
                    child: Text(widget.Ref_Gestao.get_definicao("PAGE_PERFIL_LISTAGEM_VAZIA")),
                  )
                      : ListView.builder(
                    shrinkWrap: true,
                    itemCount: patients.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Paciente ${patients[index]["nome"]} ${patients[index]["sobrenome"]}',
                          ),
                          subtitle: Text(
                            'Diagnóstico: ${patients[index]["diagnostico"]}',
                          ),
                          // Adiciona um evento de clique para abrir o modal com as informações completas do paciente
                          onTap: () {
                            _openPatientDetailsModal(context, patients[index]);
                          },
                        ),
                        Divider(color: widget.Ref_Gestao.textColor3),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Método para abrir o modal com as informações completas do paciente
  void _openPatientDetailsModal(BuildContext context, Map<String, dynamic> patientDetails) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome: ${patientDetails["nome"]} ${patientDetails["sobrenome"]}'),
              Text('Idade: ${patientDetails["idade"]}'),
              Text('Peso: ${patientDetails["peso"]}'),
              Text('Altura: ${patientDetails["altura"]}'),
              Text('Diagnóstico: ${patientDetails["diagnostico"]}'),
              // Adicione outros detalhes do paciente conforme necessário
            ],
          ),
        );
      },
    );
  }
}
