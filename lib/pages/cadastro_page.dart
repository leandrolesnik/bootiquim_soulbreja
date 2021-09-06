import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controllers/user_controller.dart';
import '../models/user_model.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String nome = "";
  String email = "";
  String senha = "";
  String foto = "";

  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: medida.width,
                height: medida.height - medida.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logoTransp.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (isLoading) CircularProgressIndicator(),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (texto) => nome = texto,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                onChanged: (texto) => email = texto,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                onChanged: (texto) => senha = texto,
              ),
              // TextFormField(
              //   decoration: InputDecoration(labelText: 'Foto'),
              //   obscureText: true,
              //   onChanged: (texto) => senha = texto,
              // ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  width: medida.width,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor),
                  child: Center(
                    child: Text(
                      "Cadastrar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
                onTap: () async {
                  try {
                    final user = UserModel(nome: nome);
                    setState(() {
                      isLoading = true;
                    });

                    await userController.signup(email, senha, user);

                    Navigator.pop(context);
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    var msg = "";

                    if (e.code == "weak-password") {
                      msg = "Senha fraca!";
                    } else if (e.code == "email-already-in-use") {
                      msg = "E-mail já cadastrado";
                    } else {
                      msg = "Ocorreu um erro";
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(msg),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
