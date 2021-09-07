import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String nome;
  final String? key;
  final Uint8List? imagem;

  UserModel({
    required this.nome,
    this.key,
    this.imagem,
  });

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'],
      key: map['key'],
      imagem: map['imagem']?.bytes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'key': key,
      'imagem': imagem != null ? Blob(imagem!) : null,
    };
  }
}
