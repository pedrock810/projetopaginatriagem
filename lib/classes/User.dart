// ----------------------------------------------------------------------
// CLASSE PARA CLASSIFICAR UM USER (MEDICO) E SEUS ATRIBUTOS
// ----------------------------------------------------------------------

class User {
  static int id = 0;
  static String nome = '';
  static String sobrenome = '';
  static String email = '';
  // Adicione outros campos conforme necessário

  // Método estático para definir os valores do usuário a partir de um mapa
  static void setValuesFromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    nome = map['nome'] ?? '';
    sobrenome = map['sobrenome'] ?? '';
    email = map['email'] ?? '';
  }
}
