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
          Container(width: 220, height: 120, color: Colors.purple.shade700)
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Text("Nome Categoria"),
            Text("cerveja"),
            Column(
              children: [
                Container(width: 220, height: 120, color: Colors.purple.shade700
                    /*  child: Image.asset(
                    'assets/images/',
                    width: 220,
                    height: 120,
                  ), */

                    ),
                ListView(
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
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.ac_unit_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
