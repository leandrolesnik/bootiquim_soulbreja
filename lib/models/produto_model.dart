import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoModel {
  final String? key;
  final String ownerKey;
  final String item;
  final String descricao;
  final String quantidade;
  final String preco;
  final bool promocao;
  final String categoria;
  final Uint8List? imagem;

  ProdutoModel({
    this.key,
    required this.ownerKey,
    required this.item,
    required this.descricao,
    required this.quantidade,
    required this.preco,
    required this.promocao,
    required this.categoria,
    this.imagem,
  });

  static ProdutoModel fromMap(Map<String, dynamic> map, [String? key]) =>
      ProdutoModel(
        key: key,
        ownerKey: map['ownerKey'],
        item: map['item'],
        descricao: map['descrição'],
        quantidade: map['quantidade'],
        preco: map['Preço'],
        promocao: map['Promoção'],
        categoria: map['Categoria'],
        imagem: map['imagem']?.bytes,
      );

  Map<String, dynamic> toMap() => {
        'ownerKey': ownerKey,
        'item': item,
        'descrição': descricao,
        'quantidade': quantidade,
        'Preço': preco,
        'Promoção': promocao,
        'Categoria': categoria,
        'imagem': imagem != null ? Blob(imagem!) : null,
      };

  @override
  String toString() {
    return 'ProdutoModel(key: $key, ownerKey: $ownerKey, item: $item, Descricao: $descricao, Quantidade: $quantidade, Preco: $preco, Promoção: $promocao, Categoria: $categoria)';
  }
}
