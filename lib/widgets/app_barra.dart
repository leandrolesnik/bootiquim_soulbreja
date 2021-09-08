import 'package:flutter/material.dart';

class AppBarra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(" Bootquim SoulBreja"),
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
                // if (_cartList.length > 0)
                //   Padding(
                //     padding: const EdgeInsets.only(left: 2.0),
                //     child: CircleAvatar(
                //       radius: 8.0,
                //       backgroundColor: Colors.red,
                //       foregroundColor: Colors.white,
                //       child: Text(
                //         _cartList.length.toString(),
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 12.0,
                //         ),
                //       ),
                //     ),
                //   ),
              ],
            ),
            onTap: () {
              // if (_cartList.isNotEmpty)
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => Cart(_cartList),
              //     ),
              //   );
            },
          ),
        )
      ],
    );
  }
}
