import 'package:flutter/material.dart';

class HR extends StatelessWidget {
  const HR({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      height: 2,
      width: MediaQuery.of(context).size.width - 20,
      color: Color(0xffF2c6A0),
    );
  }
}
