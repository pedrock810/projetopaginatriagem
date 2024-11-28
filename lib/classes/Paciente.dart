// ----------------------------------------------------------------------
// CLASSE PARA CLASSIFICAR UM PACIENTE E SEUS ATRIBUTOS
// ----------------------------------------------------------------------

class Paciente {
  static String nome = '';
  static String sobrenome = '';
  static String utente = '';
  static String genero = '';
  static String idade = '';
  static String peso = '';
  static String altura = '';
  static String contacto = '';
  static String diagnostico = '';

  // Método estático para definir os valores do paciente a partir de parâmetros
  static void setDadosPaciente({
    required String novoNome,
    required String novoSobrenome,
    required String novoUtente,
    required String novoGenero,
    required String novaIdade,
    required String novoPeso,
    required String novaAltura,
    required String novoContacto,
  }) {
    nome = novoNome;
    sobrenome = novoSobrenome;
    utente = novoUtente;
    genero = novoGenero;
    idade = novaIdade;
    peso = novoPeso;
    altura = novaAltura;
    contacto = novoContacto;
  }

  // Método estático para definir os valores do paciente a partir de parâmetros
  static void setDiagnostico({
    required String novoDiagnostico,
  }) {
    diagnostico = novoDiagnostico;
  }
}
