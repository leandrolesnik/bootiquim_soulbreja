import 'package:firebase_auth/firebase_auth.dart';
import '../controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cadastro_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String senha = "";
  String error = "";

  late final UserController userController =
      Provider.of<UserController>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: medida.width - 60,
                  height: medida.width - 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logoTransp.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                  onChanged: (texto) => email = texto,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  onChanged: (texto) => senha = texto,
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      await userController.login(email, senha);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } on FirebaseAuthException catch (e) {
                      var msg = "";
                      if (e.code == "wrong-password") {
                        msg = "A senha está incorreta";
                      } else if (e.code == "invalid-email") {
                        msg = "Email inválido";
                      } else {
                        msg = "Ocorreu um erro";
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Ocorreu um erro. ($msg)'),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: medida.width,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor),
                    child: Center(
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CadastroPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Criar conta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
