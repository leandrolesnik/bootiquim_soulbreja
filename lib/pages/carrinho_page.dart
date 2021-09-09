import 'package:bootquim_soulbreja/controllers/user_controller.dart';
import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  final List<ProdutoModel> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
  List<ProdutoModel> _cart;

  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  @override
  Widget build(BuildContext context) {
    totalPreco(List<ProdutoModel> produtos) {
      double soma = 0;
      for (var item in produtos) {
        soma += int.parse(item.preco);
      }
      return (soma);
    }

    String total = totalPreco(_cart).toString();
    Map compras = _cart.asMap();

    // Map compras = {for (var item in _cart) '$item': '$item'};
    print(compras);
    print("_____");
    print(_cart);
    print("_____");

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
                  Text(
                    "Total R\$$total",
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    onPressed: () async {
                      final historico = await FirebaseFirestore.instance
                          .collection("usuarios")
                          .doc("historico")
                          .get();
                      // .set(compras);
                      // .doc(userController.user!uid).get();

                      // final data = user.data()!;
                    },
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
