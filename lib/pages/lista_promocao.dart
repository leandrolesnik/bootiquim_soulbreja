import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'carrinho_page.dart';
import 'package:bootquim_soulbreja/widgets/drawer.dart';

import 'package:flutter/material.dart';

class ListaPromocao extends StatefulWidget {
  @override
  _ListaPromocaoState createState() => _ListaPromocaoState();
}

class _ListaPromocaoState extends State<ListaPromocao> {
  List<ProdutoModel> _cartList = <ProdutoModel>[];
  // var imagemBranco =
  //     "https://mamonimaternity.com/wp-content/uploads/2021/06/dummy-products-300x300.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Bootquim SoulBreja"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_cartList.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_cartList),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      drawer: DrawerMenu(),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('produtos')
            .where('categoria', isEqualTo: "Teste")
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
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Container(
                        height: MediaQuery.of(context).size.height / 3.5,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: MemoryImage(item.imagem!),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      Container(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.item,
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      item.item,
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amberAccent,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "R\$${item.preco}",
                                        style: TextStyle(
                                          fontSize: 28,
                                          color: Colors.red.shade700,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.green,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _cartList.add(item);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
