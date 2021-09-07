import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:provider/provider.dart';

class VinhoPage extends StatefulWidget {
  @override
  _VinhoPageState createState() => _VinhoPageState();
}

class _VinhoPageState extends State<VinhoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
        .collection('Produtos')
        .where('Categoria', isEqualTo: 'Vinho')
        .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final produtos = snapshot.data!.docs.map((map) {
            final data = map.data();
            return ProdutoModel.fromMap(data, map.id);
          }).toList();

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                return ListTile(
                  title: Text(produto.item),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.description),
                                Text(produto.descricao),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.price_change),
                                Text(produto.preco),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  leading: produto.imagem != null
                      ? Image.memory(
                          produto.imagem!,
                          fit: BoxFit.cover,
                          width: 140,
                          height: 200,
                        )
                      : Container(
                          child: Icon(Icons.location_on),
                          width: 140,
                          height: double.maxFinite,
                          color: Colors.blue,
                        ),
                  onTap: () {},
                );
              },
            ),
          );
        },
      ),
    );
  }
}
