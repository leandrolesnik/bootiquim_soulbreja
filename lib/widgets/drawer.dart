import 'package:bootquim_soulbreja/controllers/user_controller.dart';
import 'package:bootquim_soulbreja/models/user_model.dart';
import 'package:bootquim_soulbreja/pages/cerveja_page.dart';
import 'package:bootquim_soulbreja/pages/home_page.dart';
import 'package:bootquim_soulbreja/pages/lista_promocao.dart';
import 'package:bootquim_soulbreja/pages/vinho_page.dart';
import 'package:bootquim_soulbreja/pages/whisky_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late final userController = Provider.of<UserController>(
      context,
      listen: false,
    );

    return Drawer(
      child: ListView(
        children: [
          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('usuarios')
                .doc(userController.user!.uid)
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return DrawerHeader(
                    child: Center(child: CircularProgressIndicator()));
              }
              final user = UserModel.fromMap(snapshot.data!.data()!);
              return UserAccountsDrawerHeader(
                accountName: Text(user.nome),
                accountEmail: Text(userController.user!.email!),
                // currentAccountPicture: CircleAvatar(
                //     foregroundImage: MemoryImage(userController.model.imagem!)),
              );
            },
          ),

          // UserAccountsDrawerHeader(
          //   accountName: Text("Bootquim SoulBrejas"),
          //   accountEmail: Text("soulbreja@gmail.com"),
          // currentAccountPicture: CircleAvatar(
          //   foregroundImage: MemoryImage(userController.model.imagem!),

          ListTile(
              leading: Icon(Icons.person),
              title: Text(" - Home"),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => HomePage()));
              }),
          ListTile(
              leading: Icon(Icons.military_tech),
              title: Text("Promoções"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListaPromocao()));
              }),
          ListTile(
              leading: Icon(Icons.print),
              title: Text("Cerveja"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CervejaPage()));
              }),
          ListTile(
              leading: Icon(Icons.print),
              title: Text("Vinho"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VinhoPage()));
              }),
          ListTile(
              leading: Icon(Icons.print),
              title: Text("Whisky"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WhiskyPage()));
              }),
          ListTile(
              leading: Icon(Icons.list),
              title: Text("Tela 4..."),
              onTap: () {}),
        ],
      ),
    );
  }
}
