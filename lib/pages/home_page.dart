import 'package:flutter/material.dart';
import 'package:projetopaginatriagem/pages/pageViews/page_one.dart';
import 'package:projetopaginatriagem/pages/pageViews/perfil.dart';
import 'package:projetopaginatriagem/pages/pageViews/registo_paciente.dart';
import '../../classes/Gestor.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  final Gestor Ref_Gestao = Gestor();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //iniciar controlador de paginas
  PageController _pageController = PageController();

  //variavel para controlar o index da pagina atual
  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    widget.Ref_Gestao.home();

    return Scaffold(
      backgroundColor: widget.Ref_Gestao.backgroundColor,
      appBar: AppBar(
        backgroundColor: widget.Ref_Gestao.appBarColor, // Define a cor da AppBar
        title:
          Text(
            widget.Ref_Gestao.get_definicao("HOME_TITULO"),
            style: TextStyle(color: widget.Ref_Gestao.textColor, fontSize: widget.Ref_Gestao.fontSize),
          ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          PageOne(),
          RegistoPacientePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        //a funcao abaixo retorna um index de qual item foi feito o 'tap'
        //esse index é passado para o jumpToPage
        onTap: (int index) {
          //Tudo que sofre alteracoes deve estar dentro de um setState()
          setState(() {
            indexBottomNavigationBar = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeOutCirc);
        },
        currentIndex: indexBottomNavigationBar,

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Nova triagem"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: "Perfil"),
        ],
      ),
    );
  }
}
