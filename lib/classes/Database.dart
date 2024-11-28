import 'package:http/http.dart' as http;
import 'dart:convert';
import 'User.dart';

// -------------------------------------------------------------------------------------------
// CLASSE PARA GERENCIAR A CONEXAO COM A BASE DE DADOS E METODOS DE COMUNICACAO COM O SERVIDOR
// -------------------------------------------------------------------------------------------

class DatabaseConnection {
  final String baseUrl =
      'http://10.0.2.2:3000';

  Future<void> sendDataToServer(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/data'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Resposta do servidor: ${response.body}');
    } else {
      throw Exception('Falha ao enviar dados para o servidor');
    }
  }

  // Método para criar novo utilizador na base de dados
  Future<void> insertUser(Map<String, dynamic> userData) async {
    final url = Uri.parse('$baseUrl/api/insertUser');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        print('Usuário inserido com sucesso');
      } else {
        print('Erro ao inserir usuário. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro de conexão: $e');
    }
  }

  // Metodo para verificar se o email existe antes de criar uma nova conta
  Future<bool> verificarEmailExistente(String email) async {
    final url = Uri.parse('$baseUrl/api/verificarEmail?email=$email');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final bool emailExiste = data['existe'];
        return emailExiste;
      } else {
        throw Exception('Erro ao verificar e-mail');
      }
    } catch (e) {
      print('Erro de conexão: $e');
      return false;
    }
  }

  // Metodo para verificar credenciais de login
  Future<Map<String, dynamic>> verificarLogin(
      String email, String senha) async {
    final url = Uri.parse('$baseUrl/api/verificarLogin');
    final Map<String, String> body = {'email': email, 'senha': senha};

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Erro ao verificar login');
      }
    } catch (e) {
      print('Erro de conexão: $e');
      return {
        'correto': false
      };
    }
  }

  //Metodo para listar os pacientes de cada medico com base no id
  Future<List<Map<String, dynamic>>> listarPacientes(int id) async {
    final url = Uri.parse('$baseUrl/api/listarPacientes?id=$id');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<Map<String, dynamic>> patientList =
            List<Map<String, dynamic>>.from(data);
        return patientList;
      } else {
        throw Exception(
            'Erro ao listar pacientes - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao chamar listarPacientes: $e');
      return [];
    }
  }

  // Enviar paciente para a base de dados - final da triagem
  Future<void> salvarPacienteNoDB({
    required String novoNome,
    required String novoSobrenome,
    required String novoUtente,
    required String novoGenero,
    required String novaIdade,
    required String novoPeso,
    required String novaAltura,
    required String novoContacto,
    required String novoDiagnotico,
  }) async {
    final url = Uri.parse('$baseUrl/salvarPacienteDB');

    final Map<String, dynamic> dadosPaciente = {
      'nome': novoNome,
      'sobrenome': novoSobrenome,
      'utente': novoUtente,
      'genero': novoGenero,
      'idade': novaIdade,
      'peso': novoPeso,
      'altura': novaAltura,
      'contacto': novoContacto,
      'diagnostico': novoDiagnotico,
      'idMedico': User.id
    };

    try {
      final response = await http.post(
        url,
        body: jsonEncode(dadosPaciente),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Paciente salvo com sucesso!');
      } else {
        print('Erro ao salvar paciente: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro de conexão: $e');
    }
  }
}
