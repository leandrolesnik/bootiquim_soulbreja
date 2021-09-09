import 'dart:typed_data';
import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:flutter/material.dart';

import 'carrinho_page.dart';

class ProdutoPage extends StatefulWidget {
  final ProdutoModel produto;

  ProdutoPage({required this.produto});

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  List<ProdutoModel> _cartList = <ProdutoModel>[];
  late final categoriaCont = widget.produto.categoria;
  late final itemCont = widget.produto.item;
  late final descricaoCont = widget.produto.descricao;
  late final precoCont = widget.produto.preco;
  late final qtdCont = widget.produto.quantidade;
  late Uint8List? file = widget.produto.imagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoriaCont),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
          child: Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Text(
                  //   categoriaCont,
                  //   style: TextStyle(fontSize: 25),
                  // ),
                  Image(image: MemoryImage(file!), height: 300),
                  Text(
                    itemCont,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w200,
                      color: Color(0xff733a19),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30, top: 15),
                    child: Text('$descricaoCont',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff733a19),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Quantidade: $qtdCont',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xffD96A29),
                        ),
                      ),
                      Text(
                        'R\$$precoCont',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xffD96A29)),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            _cartList.add(widget.produto);
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffF2c6A0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
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
  }
}
