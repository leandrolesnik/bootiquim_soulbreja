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
      ),
      //************************************************/
      //********************** DRAWER *****************/
      //************************************************/
      drawer: Drawer(
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
                title: Text(" Tela 2"),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.print),
                title: Text("Tela 3"),
                onTap: () {}),
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
