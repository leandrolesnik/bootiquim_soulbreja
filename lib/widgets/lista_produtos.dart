import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:flutter/material.dart';

Expanded ListaProdutos(BuildContext context, ProdutoModel item) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Container(
          height: MediaQuery.of(context).size.height / 4,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(image: MemoryImage(item.imagem!)),
          ),
        ),
        Container(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.item,
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        item.item,
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
                Text(
                  "R\$${item.preco}",
                  style: TextStyle(fontSize: 28, color: Colors.red.shade700),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
