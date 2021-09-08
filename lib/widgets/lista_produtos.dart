import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:flutter/material.dart';

Expanded ListaProdutos(BuildContext context, ProdutoModel item) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: MemoryImage(item.imagem!), fit: BoxFit.fitHeight),
          ),
        ),
        Container(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        item.item,
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amberAccent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "R\$${item.preco}",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
