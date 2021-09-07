import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:bootquim_soulbreja/pages/home_page.dart';
import 'package:bootquim_soulbreja/pages/login_page.dart';
import 'package:bootquim_soulbreja/pages/vinho_page.dart';
import 'package:bootquim_soulbreja/widgets/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'vinho_page.dart';
import 'package:flutter/material.dart';

class ListaPromocao extends StatefulWidget {
  @override
  _ListaPromocaoState createState() => _ListaPromocaoState();
}

class _ListaPromocaoState extends State<ListaPromocao> {
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
            .collection('Produtos')
            .where('Promoção', isEqualTo: true)
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
              return Card(
                color: Colors.amber,
                margin: EdgeInsets.all(5),
                borderOnForeground: false,
                child: ListTile(
                  leading: item.imagem != null
                      ? Image.memory(
                          item.imagem!,
                          fit: BoxFit.contain,
                          width: 125,
                          height: 200,
                        )
                      : Container(
                          width: 125,
                          height: 200,
                          // height: double.maxFinite,
                          color: Colors.blue,
                        ),
                  title: Text(
                    item.item,
                    style: TextStyle(fontSize: 24),
                  ),
                  subtitle: Text(
                    item.descricao,
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Text(
                    "R\$${item.preco}",
                    style: TextStyle(fontSize: 18, color: Colors.red.shade700),
                  ),
                  horizontalTitleGap: 10,
                  tileColor: Colors.blueGrey.shade100,
                  minVerticalPadding: 10,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
