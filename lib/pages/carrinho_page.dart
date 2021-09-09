import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final List<ProdutoModel> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  List<ProdutoModel> _cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: _cart.length,
        itemBuilder: (context, index) {
          var item = _cart[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Card(
              elevation: 4.0,
              child: Column(
                children: [
                  Container(height: 200, child: Image.memory(item.imagem!)),
                  Text(item.item),
                  Text("R\$${item.preco}"),
                  GestureDetector(
                    child: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onTap: () {
                      setState(
                        () {
                          _cart.remove(item);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Text("COMPRAR"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
