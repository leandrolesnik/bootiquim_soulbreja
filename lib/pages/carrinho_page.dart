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
        title: Text('Finalizar'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total"),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 36.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _cart.length,
        itemBuilder: (context, index) {
          var item = _cart[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Card(
              elevation: 4.0,
              child: ListTile(
                leading: Image.memory(item.imagem!),
                title: Text(item.item),
                subtitle: Text("R\$${item.preco}"),
                trailing: GestureDetector(
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
              ),
            ),
          );
        },
      ),
    );
  }
}
