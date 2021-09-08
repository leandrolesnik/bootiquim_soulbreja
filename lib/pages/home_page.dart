import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:bootquim_soulbreja/pages/lista_promocao.dart';
import 'package:bootquim_soulbreja/pages/login_page.dart';
import 'package:bootquim_soulbreja/widgets/app_barra.dart';
import 'package:bootquim_soulbreja/widgets/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'carrinho_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final List<String> imagesList = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2016/11/18/19/00/breads-1836411_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg'
];

class _HomePageState extends State<HomePage> {
  List<ProdutoModel> _cartList = <ProdutoModel>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Bootquim SoulBreja"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_cartList.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_cartList),
                    ),
                  );
              },
            ),
          )
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
          Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
            child: Column(
              children: [
                //*******************Imagem topo - CARROSEL */
                Container(
                  child: InkWell(
                    onTap: () {Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => ListaPromocao()));},
                    child: CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                          ),
                          items: imagesList
                              .map(
                                (item) => Container(
                    child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                                ),
                              )
                              .toList(),
                        ),
                  ),
                ),
                //********************FINAL DO CARROSEL */
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                      child: Text("Categorias")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                  margin: EdgeInsets.all(5),
                  child: InkWell(
                    child: Image.asset(
                      '../../assets/images/heineken.jpg',
                      width: 80,
                    ),
                    // onTap: () => launch(    <<< Não esquecer o pacote do launcher
                    //   'CAMINHO DO ON TAP',
                    // ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: InkWell(
                    child: Image.asset(
                      '../../assets/images/heineken.jpg',
                      width: 80,
                    ),
                    // onTap: () => launch(    <<< Não esquecer o pacote do launcher
                    //   'CAMINHO DO ON TAP',
                    // ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: InkWell(
                    child: Image.asset(
                      '../../assets/images/heineken.jpg',
                      width: 80,
                    ),
                    // onTap: () => launch(    <<< Não esquecer o pacote do launcher
                    //   'CAMINHO DO ON TAP',
                    // ),
                  ),
                ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
