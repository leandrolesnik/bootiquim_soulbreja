import 'package:provider/provider.dart';

import 'produto_page.dart';
import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Bootquim SoulBreja"),
      ),
      //************************************************/
      //********************** DRAWER *****************/
      //************************************************/
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(userController.model.nome),
              accountEmail: Text(userController.user!.email!),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  '../../assets/images/logo.png',
                ),
                // backgroundImage: MemoryImage(userController.model.imagem!),
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
                title: Text(" Tela 2"),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.print),
                title: Text("Produto"),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => ProdutoPage()));
                }),
            ListTile(
                leading: Icon(Icons.list),
                title: Text("Tela 4..."),
                onTap: () {}),
          ],
        ),
      ),
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
