import 'package:flutter/material.dart';

class ProdutoPage extends StatefulWidget {
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bootquim Soulbreja"),
        centerTitle: true,
        actions: [
          Text("usuario"),
        ],
      ),
      //drawer: Drawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Nome Categoria"),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Text('carrinho'),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 220,
                    height: 120,
                    color: Colors.purple.shade700,
                    child: Image.asset(
                      'assets/images/',
                    ),
                  ),
                  /*  ListView(
                    children: [
                      Container(
                        child: Text("Nome Produto"),
                      ),
                      Container(
                        child: Text("Nome Produto"),
                      ),
                      Container(
                        child: Text("Nome Produto"),
                      )
                    ],
                  ), */
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.ac_unit_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
