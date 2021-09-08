import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:bootquim_soulbreja/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cerveja_page.dart';
import 'vinho_page.dart';

import 'package:bootquim_soulbreja/widgets/drawer.dart';
import 'package:bootquim_soulbreja/widgets/lista_produtos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ListaPromocao extends StatefulWidget {
  @override
  _ListaPromocaoState createState() => _ListaPromocaoState();
}

class _ListaPromocaoState extends State<ListaPromocao> {
  var imagemBranco =
      "https://mamonimaternity.com/wp-content/uploads/2021/06/dummy-products-300x300.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promoções"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: 'Entrar',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      drawer: DrawerMenu(),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('produtos')
            .where('promocao', isEqualTo: true)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final produtos = snapshot.data!.docs.map(
            (item) {
              final dados = item.data();
              return ProdutoModel.fromMap(dados);
            },
          ).toList();
          return ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              final item = produtos[index];
              return SingleChildScrollView(
                child: ListaProdutos(context, item),
              );
            },
          );
        },
      ),
    );
  }
}
