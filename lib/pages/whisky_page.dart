import 'package:bootquim_soulbreja/pages/produto_page.dart';
import 'package:bootquim_soulbreja/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'carrinho_page.dart';

class WhiskyPage extends StatefulWidget {
  @override
  _WhiskyPageState createState() => _WhiskyPageState();
}

class _WhiskyPageState extends State<WhiskyPage> {
  List<ProdutoModel> _cartList = <ProdutoModel>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whiskies"),
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
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('produtos')
            .where('categoria', isEqualTo: 'Whisky')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final produtos = snapshot.data!.docs.map((map) {
            final data = map.data();
            return ProdutoModel.fromMap(data, map.id);
          }).toList();

          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              final item = produtos[index];
              return SingleChildScrollView(
                child: Expanded(
                  child: GestureDetector(
                    onTap: () {
                      //**** ABRE O DIALOG COM O PRODUTO ****/
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            contentPadding: EdgeInsets.all(10),
                            insetPadding: EdgeInsets.all(10),
                            elevation: 5,
                            content: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 20),
                                child: Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Image(
                                            image: MemoryImage(item.imagem!),
                                            height: 300),
                                        Text(
                                          item.item,
                                          style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w200,
                                            color: Color(0xff733a19),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 30, top: 15),
                                          child: Text('${item.descricao}',
                                              style: TextStyle(
                                                fontSize: 24,
                                                color: Color(0xff733a19),
                                              )),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Quantidade: ${item.quantidade}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xffD96A29),
                                              ),
                                            ),
                                            Text(
                                              'R\$${item.preco}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xffD96A29)),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: InkWell(
                                            onTap: () {
                                              setState(
                                                () {
                                                  _cartList.add(item);
                                                  Navigator.pop(context, true);
                                                },
                                              );
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xffF2c6A0),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              width: 100,
                                              height: 50,
                                              child: Text(
                                                "Comprar",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff733a19),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ProdutoPage(
                          //       produto: item,
                          //     ),
                          //   ),
                          // );
                        },
                      );
                      //***** AQUI TERMINA O DIALOG *****/
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 125,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: MemoryImage(item.imagem!),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.item,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff733a19)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item.volume,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xffD96A29)),
                                        ),
                                        SizedBox(width: 50),
                                        Text(
                                          "R\$${item.preco}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff733a19),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
