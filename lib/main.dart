import 'package:flutter/material.dart';
import 'package:projetopaginatriagem/pages/home_page.dart';
import 'package:projetopaginatriagem/pages/pageViews/login_page.dart';
import 'package:projetopaginatriagem/pages/pageViews/registo_paciente.dart';
import 'package:projetopaginatriagem/pages/pageViews/sigin_page.dart';

//O runApp chama o MyApp que chama o MaterialApp.
//O MaterialApp é responsavel pelas configuracoes gerais da app
//Um de seus atributos é o home, que é passado pela classe HomePage() criada na pasta pages
//O HomePage() retorna os widgets da app

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //remover o banner "debug" do emulador
        theme: ThemeData(primaryColor: Colors.green), //Definir o tema da app
        home: LoginPage());
  }
}
