import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Servidor {
  final String baseUrl = "http://10.0.2.2:3000";

  Future<List<Map<String, dynamic>>> obterNoticias() async {
    final response = await http.get(Uri.parse('$baseUrl/api/noticias'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Erro ao obter notícias');
    }
  }
}
