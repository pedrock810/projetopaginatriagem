import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projetopaginatriagem/pages/pageViews/login_page.dart';
import '../../classes/Database.dart';
import '../../classes/Gestor.dart';

class SiginPage extends StatefulWidget {
  SiginPage({Key? key}) : super(key: key);
  final Gestor Ref_Gestao = Gestor();

  @override
  _SiginPageState createState() => _SiginPageState();
}

class _SiginPageState extends State<SiginPage> {
  final databaseConnection = DatabaseConnection();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  void _registrarUsuario(BuildContext context) async {
    final String nome = nomeController.text;
    final String sobrenome = sobrenomeController.text;
    final String email = emailController.text;
    final String senha = senhaController.text;
    final String confirmarSenha = confirmarSenhaController.text;

    bool emailExistente =
        await databaseConnection.verificarEmailExistente(email);

    if (emailExistente) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Este e-mail já está em uso. Tente outro.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else if (senha == confirmarSenha) {
      await databaseConnection.insertUser({
        'nome': nome,
        'sobrenome': sobrenome,
        'email': email,
        'senha': senha,
      });

      widget.Ref_Gestao.perfil();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registro realizado com sucesso!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Após o registro bem-sucedido, navegue para a página LoginPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('As senhas são diferentes'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.Ref_Gestao.sigin();
    return Scaffold(
      backgroundColor: widget.Ref_Gestao.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Image.asset(
                      widget.Ref_Gestao.logoPath,
                      width: 250,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.Ref_Gestao.get_definicao("SIGIN_TITULO"),
                      style: TextStyle(
                        color: widget.Ref_Gestao.textColor,
                        fontSize: widget.Ref_Gestao.fontSize,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    controller: nomeController,
                    style: TextStyle(color: widget.Ref_Gestao.textColor),
                    decoration: InputDecoration(
                      hintText: widget.Ref_Gestao.get_definicao("SIGIN_CAMPO_1"),
                      hintStyle: TextStyle(color: widget.Ref_Gestao.textColor),
                      prefixIcon: Icon(
                        Icons.person,
                        color: widget.Ref_Gestao.textColor,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                    style: TextStyle(color: widget.Ref_Gestao.textColor),
                    decoration: InputDecoration(
                      hintText: widget.Ref_Gestao.get_definicao("SIGIN_CAMPO_2"),
                      hintStyle: TextStyle(color: widget.Ref_Gestao.textColor),
                      prefixIcon: Icon(
                        Icons.person,
                        color: widget.Ref_Gestao.textColor,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(color: widget.Ref_Gestao.textColor),
                    decoration: InputDecoration(
                      hintText: widget.Ref_Gestao.get_definicao("SIGIN_CAMPO_3"),
                      hintStyle: TextStyle(color: widget.Ref_Gestao.textColor),
                      prefixIcon: Icon(
                        Icons.email,
                        color: widget.Ref_Gestao.textColor,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    controller: senhaController,
                    style: TextStyle(color: widget.Ref_Gestao.textColor),
                    decoration: InputDecoration(
                      hintText: widget.Ref_Gestao.get_definicao("SIGIN_CAMPO_4"),
                      hintStyle: TextStyle(color: widget.Ref_Gestao.textColor),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: widget.Ref_Gestao.textColor,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    controller: confirmarSenhaController,
                    style: TextStyle(color: widget.Ref_Gestao.textColor),
                    decoration: InputDecoration(
                      hintText: widget.Ref_Gestao.get_definicao("SIGIN_CAMPO_5"),
                      hintStyle: TextStyle(color: widget.Ref_Gestao.textColor),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: widget.Ref_Gestao.textColor,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(width: 50),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _registrarUsuario(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          widget.Ref_Gestao.textColor.withOpacity(0.5)),
                      fixedSize:
                          MaterialStateProperty.all<Size>(Size.fromHeight(50)),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(fontSize: widget.Ref_Gestao.fontSize, fontWeight: widget.Ref_Gestao.fontWeight)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(widget.Ref_Gestao.textColor),
                    ),
                    child: Text(widget.Ref_Gestao.get_definicao("SIGIN_BTN")),
                  ),
                ),
                SizedBox(width: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
