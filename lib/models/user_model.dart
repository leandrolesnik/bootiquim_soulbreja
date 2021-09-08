import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String nome;
  final String? key;
  final Uint8List? imagem;
  final List? historico;

  UserModel({required this.nome, this.key, this.imagem, this.historico});

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'],
      key: map['key'],
      imagem: map['imagem']?.bytes,
      historico: map['historico'],
    );
  }

  Map<String, dynamic> toMap() => {
        'nome': nome,
        'key': key,
        'imagem': imagem != null ? Blob(imagem!) : null,
        'historico': historico,
      };
}
