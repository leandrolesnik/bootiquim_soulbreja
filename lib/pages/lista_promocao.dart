import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:bootquim_soulbreja/widgets/hr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'carrinho_page.dart';
import 'package:bootquim_soulbreja/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ListaPromocao extends StatefulWidget {
  @override
  _ListaPromocaoState createState() => _ListaPromocaoState();
}

// PALETA DE CORES
// color: Color(0xffD96A29),
// color: Color(0xff733a19),
// color: Color(0xffF2c6A0),
// color: Color(0xfff2622e),
// color: Color(0xff0d0d0d),
class _ListaPromocaoState extends State<ListaPromocao> {
  List<ProdutoModel> _cartList = <ProdutoModel>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promoções"),
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
                        backgroundColor: Color(0xffffffff),
                        foregroundColor: Color(0xffD96A29),
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
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff733a19)),
                                    ),
                                    Text(
                                      item.volume,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xffD96A29)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffF2c6A0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _cartList.add(item);
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "R\$${item.preco}",
                                          style: TextStyle(
                                            fontSize: 28,
                                            color: Color(0xff733a19),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 8),
                                        child: Icon(
                                          Icons.add_shopping_cart_outlined,
                                          color: Color(0xff733a19),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      HR()
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
