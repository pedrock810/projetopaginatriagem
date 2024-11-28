import 'package:flutter/material.dart';
import 'package:projetopaginatriagem/classes/User.dart';
import '../../classes/Paciente.dart';

// ----------------------------------------------------------------------
// CLASSE GESTOR PARA FACILITAR AS ALTERACOES NO CODIGO
// ----------------------------------------------------------------------

class Gestor{

  Map<String, dynamic> definicoes = Map();

  void add_definicao(String key, dynamic valor) {
    definicoes[key] = valor;
  }

  String get_definicao(String key) {
    if (definicoes.containsKey(key)) {
      return definicoes[key]!;
    } else {
      return "Essa chave não existe";
    }
  }

  String logoPath = 'lib/images/logo.png';

  void setLogoPath(String path) {
    logoPath = path;
  }

  Color backgroundColor = Colors.grey[200]!; // Set a default color

  void setBackgroundColor(Color color) {
    backgroundColor = color;
  }

  Color appBarColor = Colors.grey[200]!; // Set a default color

  void setAppBarColor(Color color) {
    appBarColor = color;
  }

  Color box = Colors.grey[200]!; // Set a default color

  void setBoxColor(Color color) {
    box = color;
  }

  Color textColor = Colors.black; // Valor padrão para a cor do texto

  void setColor(Color color) {
    textColor = color;
  }

  Color textColor2 = Colors.black; // Valor padrão para a cor do texto

  void setColor2(Color color) {
    textColor2 = color;
  }

  Color textColor3 = Colors.black; // Valor padrão para a cor do texto

  void setColor3(Color color) {
    textColor3 = color;
  }

  double fontSize = 16.0; // Valor padrão para a fontSize

  void setSize(double size) {
    fontSize = size;
  }

  double fontSize2 = 16.0; // Valor padrão para a fontSize

  void setSize2(double size) {
    fontSize2 = size;
  }

  double fontSize3 = 16.0; // Valor padrão para a fontSize

  void setSize3(double size) {
    fontSize3 = size;
  }

  void setWeight(FontWeight weight) {
    fontWeight = weight;
  }

  FontWeight fontWeight = FontWeight.normal;

  void login(){
    //LOGO
    setLogoPath('lib/images/logo.png');

    //BACKGROUND
    setBackgroundColor(Color(0xFF4747B9));

    //TEXTO
    this.add_definicao("LOGIN_CAMPO_1", "Email");
    this.add_definicao("LOGIN_CAMPO_2", "Senha");
    this.add_definicao("LOGIN_BTN", "Login");
    this.add_definicao("LOGIN_NOVA_CONTA", "Criar Conta");

    // TEXTSTYLE
    setColor(Colors.white);
    setSize(18.0);
    setWeight(FontWeight.bold);
  }

  void sigin(){
    //LOGO
    setLogoPath('lib/images/logo.png');

    //BACKGROUND
    setBackgroundColor(Color(0xFF4747B9));

    //TEXTO
    this.add_definicao("SIGIN_TITULO", "Criar nova conta");
    this.add_definicao("SIGIN_CAMPO_1", "Nome");
    this.add_definicao("SIGIN_CAMPO_2", "Sobrenome");
    this.add_definicao("SIGIN_CAMPO_3", "Email");
    this.add_definicao("SIGIN_CAMPO_4", "Senha");
    this.add_definicao("SIGIN_CAMPO_5", "Confirmar senha");
    this.add_definicao("SIGIN_BTN", "Registrar");

    // TEXTSTYLE
    setColor(Colors.white);
    setSize(18.0);
    setWeight(FontWeight.bold);
  }

  void one(){
    //BACKGROUND
    setBackgroundColor(Colors.grey[200]!);

    //TEXTO
    this.add_definicao("PAGE_ONE_TITULO_1", "Últimas notícias");
    this.add_definicao("PAGE_ONE_TITULO_2", "Titulo recebido das definicoes");
    this.add_definicao("PAGE_ONE_LINK_IMAGEM_1", "https://google.com.br");
    this.add_definicao("PAGE_ONE_TEXTO", "Texto recebido da classe Gestor");

    // TEXTSTYLE
    setColor(Colors.black);
    setSize(27.0);
  }

  void home(){
    //APPBAR
    setAppBarColor(Color(0xFF1f1f52));
    this.add_definicao("HOME_TITULO", "Smart Medicine");

    // TEXTSTYLE
    setColor(Colors.white);
    setSize(20.0);
    setWeight(FontWeight.bold);
  }


  void registoTriagem(){
    //BACKGROUND
    setBackgroundColor(Color(0xFF4747B9));

    //TEXTO
    this.add_definicao("PAGE_REGISTOTRIAGEM_TITULO", "Iniciar Triagem");
    this.add_definicao("PAGE_REGISTOTRIAGEM_CAMPO_1", "Nome do paciente");
    this.add_definicao("PAGE_REGISTOTRIAGEM_CAMPO_2", "Sobrenome");
    this.add_definicao("PAGE_REGISTOTRIAGEM_CAMPO_3", "Nº Utente");
    this.add_definicao("PAGE_REGISTOTRIAGEM_CAMPO_4", "Gênero");
    this.add_definicao("PAGE_REGISTOTRIAGEM_CAMPO_5", "Idade");
    this.add_definicao("PAGE_REGISTOTRIAGEM_CAMPO_6", "Peso");
    this.add_definicao("PAGE_REGISTOTRIAGEM_CAMPO_7", "Altura");
    this.add_definicao("PAGE_REGISTOTRIAGEM_CAMPO_8", "Contacto");
    this.add_definicao("PAGE_REGISTOTRIAGEM_BTN", "Avançar");

    // TEXTSTYLE
    setColor(Colors.white);
    setSize(27.0);
    setSize2(18.0);
  }

  void triagem(){
    this.add_definicao("PAGE_TRIAGEM_TITULO", "Triagem");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_1", "Você está sentindo dor no peito?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_2", "Você teve febre recentemente?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_3", "Você tem dificuldade para respirar?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_4", "Você teve vômitos nas últimas 24 horas?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_5", "Você está sentindo tonturas ou vertigens?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_6", "Você teve diarreia nas últimas 48 horas?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_7", "Você notou sangue na urina ou fezes recentemente?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_8", "Você teve perda de peso inexplicada recentemente?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_9", "Você tem notado sangramento incomum ou prolongado?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_10", "Você teve algum episódio de desmaio recentemente?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_11", "Você teve convulsões nos últimos dias?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_12", "Você tem notado alguma alteração na sua visão ultimamente?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_13", "Você teve algum episódio de dormência ou formigamento?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_14", "Você tem tido dificuldade em engolir alimentos ou líquidos?");
    this.add_definicao("PAGE_TRIAGEM_CAMPO_15", "Você tem sentido dores de cabeça graves e persistentes?");
    this.add_definicao("PAGE_TRIAGEM_BTN", "Terminar");

    //BOX
    setBoxColor(Color(0xFF4747B9));

    // TEXTSTYLE
    setColor(Colors.white);
  }

  void diagnostico(){
    //BACKGROUND
    setBackgroundColor(Color(0xFF1f1f52));

    //TEXTO
    this.add_definicao("PAGE_DIAGNOSTICO_1", "Emergência");
    this.add_definicao("PAGE_DIAGNOSTICO_2", "Urgência");
    this.add_definicao("PAGE_DIAGNOSTICO_3", "Semiurgência");
    this.add_definicao("PAGE_DIAGNOSTICO_4", "Pouco Urgente");
    this.add_definicao("PAGE_DIAGNOSTICO_5", "Não Urgente");

    this.add_definicao("PAGE_DIAGNOSTICO_FINAL_1", "Smart Medicine");
    this.add_definicao("PAGE_DIAGNOSTICO_FINAL_2", "Diagnóstico do(a) ${Paciente.nome}:");

    // TEXTSTYLE
    setColor(Colors.white);
    setColor2(Colors.black);
    setSize(20.0);
    setSize2(24.0);
    setWeight(FontWeight.bold);
  }

  void perfil(){
    //BACKGROUND
    setBackgroundColor(Color(0xFF4747B9));

    //TEXTO
    this.add_definicao("PAGE_PERFIL_TITULO", "Página Pessoal");
    this.add_definicao("PAGE_PERFIL_NOME_SOBRENOME", "${User.nome} ${User.sobrenome}");
    this.add_definicao("PAGE_PERFIL_EMAIL", "${User.email}");

    this.add_definicao("PAGE_PERFIL_LISTAGEM", "Listagem de Pacientes");
    this.add_definicao("PAGE_PERFIL_LISTAGEM_VAZIA", "Ainda não há pacientes registrados");

    // TEXTSTYLE
    setColor(Colors.white);
    setColor2(Colors.black);
    setColor3(Colors.grey);
    setSize(27.0);
    setSize2(24.0);
    setSize3(18.0);
    setWeight(FontWeight.bold);
  }
}