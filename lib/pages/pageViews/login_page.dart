import 'package:flutter/material.dart';
import 'package:projetopaginatriagem/pages/home_page.dart';
import 'package:projetopaginatriagem/pages/pageViews/sigin_page.dart';
import '../../classes/Database.dart';
import '../../classes/User.dart';
import '../../classes/Gestor.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final Gestor Ref_Gestao = Gestor();

  final databaseConnection = DatabaseConnection();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void _verificarLogin(BuildContext context) async {
    final String email = emailController.text;
    final String senha = senhaController.text;

    Map<String, dynamic> resultado =
        await databaseConnection.verificarLogin(email, senha);

    if (resultado['correto']) {
      // Se o login estiver correto, crie uma instância da classe User
      User.setValuesFromMap(resultado['usuario']);

      // Ou navegar para a próxima página (por exemplo, a página inicial) sem passar os detalhes do usuário
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Se o login estiver incorreto, exiba uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('E-mail ou senha incorretos. Tente novamente.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    this.Ref_Gestao.login();

    return Scaffold(
      backgroundColor: this.Ref_Gestao.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Image.asset(
                      this.Ref_Gestao.logoPath,
                      width: 250,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(color: this.Ref_Gestao.textColor),
                    decoration: InputDecoration(
                      hintText: this.Ref_Gestao.get_definicao("LOGIN_CAMPO_1"),
                      hintStyle: TextStyle(color: this.Ref_Gestao.textColor),
                      prefixIcon: Icon(
                        Icons.person,
                        color: this.Ref_Gestao.textColor,
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
                    controller: senhaController,
                    style: TextStyle(color: this.Ref_Gestao.textColor),
                    decoration: InputDecoration(
                      hintText: this.Ref_Gestao.get_definicao("LOGIN_CAMPO_2"),
                      hintStyle: TextStyle(color: this.Ref_Gestao.textColor),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: this.Ref_Gestao.textColor,
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
                    onPressed: () {
                      _verificarLogin(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          this.Ref_Gestao.textColor.withOpacity(0.5)),
                      fixedSize:
                          MaterialStateProperty.all<Size>(Size.fromHeight(50)),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(fontSize: this.Ref_Gestao.fontSize, fontWeight: this.Ref_Gestao.fontWeight),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(this.Ref_Gestao.textColor),
                    ),
                    child: Text(this.Ref_Gestao.get_definicao("LOGIN_BTN")),
                  ),
                ),
                SizedBox(width: 50),
              ],
            ),
            SizedBox(height: 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SiginPage(),
                      ),
                    );
                  },
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        this.Ref_Gestao.get_definicao("LOGIN_NOVA_CONTA"),
                        style: TextStyle(
                          color: this.Ref_Gestao.textColor,
                          fontSize: this.Ref_Gestao.fontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
