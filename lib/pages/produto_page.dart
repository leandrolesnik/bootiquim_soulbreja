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
        title: Text("Editar diário"),
        
      
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Text(itemCont),
              Text(descricaoCont),
              Text(precoCont),
              ListTile(
                leading: file != null
                    ? Image.memory(
                       file!,
                        fit: BoxFit.cover,
                        width: 72,
                      )
                    : Container(
                        child: Icon(Icons.location_on),
                        width: 72,
                        height: double.maxFinite,
                        color: Colors.blue,
                      ),),
              
              
              
             
            ],
          ),
        ),
      ),
    );
  }
}
