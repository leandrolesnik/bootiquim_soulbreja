import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// OI
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bootquim Soulbreja',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // home: HomePage(),
    );
  }
}
