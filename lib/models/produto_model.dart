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
  final String volume;

  ProdutoModel({
    this.key,
    required this.ownerKey,
    required this.item,
    required this.descricao,
    required this.quantidade,
    required this.preco,
    required this.promocao,
    required this.categoria,
    required this.volume,
    this.imagem,
  });

  static ProdutoModel fromMap(Map<String, dynamic> map, [String? key]) =>
      ProdutoModel(
        key: key,
        ownerKey: map['ownerKey'],
        item: map['item'],
        descricao: map['descricao'],
        quantidade: map['quantidade'],
        preco: map['preco'],
        promocao: map['promocao'],
        categoria: map['categoria'],
        volume: map['volume'],
        imagem: map['imagem']?.bytes,
      );

  Map<String, dynamic> toMap() => {
        'ownerKey': ownerKey,
        'item': item,
        'descricao': descricao,
        'quantidade': quantidade,
        'preco': preco,
        'promocao': promocao,
        'categoria': categoria,
        'volume': volume,
        'imagem': imagem != null ? Blob(imagem!) : null,
      };

  @override
  String toString() {
    return 'key: $key, ownerKey: $ownerKey, item: $item, descricao: $descricao, quantidade: $quantidade, preco: $preco, promocao: $promocao, categoria: $categoria, volume $volume';
  }
}
