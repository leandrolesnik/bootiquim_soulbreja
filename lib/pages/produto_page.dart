import 'dart:typed_data';

import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProdutoPage extends StatefulWidget {
  final ProdutoModel produto;

  ProdutoPage({required this.produto});

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  late final itemCont = widget.produto.item;
  late final descricaoCont = widget.produto.descricao;
  late final precoCont = widget.produto.preco;
  late Uint8List? file = widget.produto.imagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produto"),
        
      
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Text("Categoria", style: TextStyle(fontSize: 25),),
                    Image(image: MemoryImage(file!), height: 200),

                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children:[ 
                      Text(itemCont, style: TextStyle(fontSize: 22),),
                      Text('R\$$precoCont', style: TextStyle(fontSize: 22),),
                    ]
                    ),
                  Text('Descrição: $descricaoCont', style: TextStyle(fontSize: 19),),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
