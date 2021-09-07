import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:bootquim_soulbreja/pages/home_page.dart';
import 'package:bootquim_soulbreja/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'produto_page.dart';
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
        title: Text("Bootquim"),
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
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Bootquim SoulBrejas"),
              accountEmail: Text("soulbreja@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  '../../assets/images/logo.png',
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(" - Home"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => HomePage()));
                }),
            ListTile(
                leading: Icon(Icons.military_tech),
                title: Text("Categorias"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListaPromocao()));
                }),
            ListTile(
                leading: Icon(Icons.print),
                title: Text("Produto"),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => ProdutoPage()));
                }),
            ListTile(
                leading: Icon(Icons.list),
                title: Text("Tela 4..."),
                onTap: () {}),
          ],
        ),
      ),
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
              return ListTile(
                leading: item.imagem != null
                    ? Image.memory(
                        item.imagem!,
                        fit: BoxFit.contain,
                        width: 200,
                        height: 200,
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        // height: double.maxFinite,
                        color: Colors.blue,
                      ),
                title: Text(
                  item.item,
                  style: TextStyle(fontSize: 21),
                ),
                subtitle: Text(
                  item.descricao,
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Text(
                  "R\$ ${item.preco}",
                  style: TextStyle(fontSize: 21),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
