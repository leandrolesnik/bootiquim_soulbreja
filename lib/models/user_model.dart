class UserModel {
  final String nome;
  final String? id;

  UserModel({
    required this.nome,
    this.id,
  });

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'],
      id: map['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'id': id,
    };
  }
}
