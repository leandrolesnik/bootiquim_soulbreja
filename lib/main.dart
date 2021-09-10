// import 'package:bootquim_soulbreja/pages/home_page.dart';
// import 'package:bootquim_soulbreja/pages/lista_promocao.dart';
import 'package:bootquim_soulbreja/pages/vinho_page.dart';
import 'pages/login_page.dart';
import 'pages/produto_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'controllers/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// OI
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bootquim Soulbreja',
        theme: ThemeData(
          primaryColor: Color(0xFFF2622E),
          accentColor: Color(0xFFF2C6A0),
          primarySwatch: Colors.deepOrange,
          textTheme:
              GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme),
        ),
        home: LoginPage(),
      ),
    );
  }
}
