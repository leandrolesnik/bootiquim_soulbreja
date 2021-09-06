class UserModel {
  final String nome;
  final String? key;

  UserModel({
    required this.nome,
    this.key,
  });

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'],
      key: map['key'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'key': key,
    };
  }
}
