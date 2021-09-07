import 'package:bootquim_soulbreja/pages/cerveja_page.dart';
import 'package:bootquim_soulbreja/pages/home_page.dart';
import 'package:bootquim_soulbreja/pages/lista_promocao.dart';
import 'package:bootquim_soulbreja/pages/vinho_page.dart';
import 'package:bootquim_soulbreja/pages/whisky_page.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Bootquim SoulBrejas"),
            accountEmail: Text("soulbreja@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                '../../assets/images/logo.png',
              ),
            ),
          ),
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