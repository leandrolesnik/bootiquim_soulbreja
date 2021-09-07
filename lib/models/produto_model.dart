import 'dart:typed_data';
 
import 'package:cloud_firestore/cloud_firestore.dart';
 
class ProdutoModel {
  final String? key;
  final String ownerKey;
  final String categoria;
  final String descricao;
  final bool promocao;
  final String preco;
  final String item;
  final Uint8List? imagem;
 
  ProdutoModel({
    this.key,
    required this.ownerKey,
    required this.categoria,
    required this.descricao,
    required this.promocao,
    required this.item,
    required this.preco,
    this.imagem,
  });
 
  static ProdutoModel fromMap(Map<String, dynamic> map, [String? key]) =>
      ProdutoModel(
        key: key,
        ownerKey: map['ownerKey'],
        categoria: map['Categoria'],
        item: map['item'],
        promocao: map['Promoção'],
        descricao: map['descrição'],
        preco: map['Preço'],
        imagem: map['imagem']?.bytes,
      );
 
  Map<String, dynamic> toMap() => {
        'ownerKey': ownerKey,
        'categoria': categoria,
        'descricao': descricao,
        'Promoção': promocao,
        'preco': preco,
        'item': item,
        'imagem': imagem != null ? Blob(imagem!) : null,
      };
}
 