import 'package:bootquim_soulbreja/pages/cerveja_page.dart';
import 'package:bootquim_soulbreja/pages/login_page.dart';
import 'package:bootquim_soulbreja/pages/vinho_page.dart';
import 'package:bootquim_soulbreja/pages/whisky_page.dart';
import 'package:bootquim_soulbreja/widgets/drawer.dart';
import 'lista_promocao.dart';
import 'vinho_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Bootquim SoulBreja"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: 'Entrar',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      //************************************************/
      //********************** DRAWER *****************/
      //************************************************/
      drawer: DrawerMenu(),
      //************************************************/
      //********************** BODY ********************/
      //************************************************/

      body: ListView(
        children: [
          Column(
            children: [
              //*******************Imagem topo */
              Container(
                margin: EdgeInsets.all(5),
                child: InkWell(
                  child: Image.asset(
                    '../../assets/images/heineken.jpg',
                    width: 200,
                  ),
                  // onTap: () => launch(    <<< Não esquecer o pacote do launcher
                  //   'CAMINHO DO ON TAP',
                  // ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("Categorias")],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
