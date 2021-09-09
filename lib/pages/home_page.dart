import 'package:bootquim_soulbreja/models/produto_model.dart';
import 'package:bootquim_soulbreja/pages/cerveja_page.dart';
import 'package:bootquim_soulbreja/pages/lista_promocao.dart';
import 'package:bootquim_soulbreja/pages/vinho_page.dart';
import 'package:bootquim_soulbreja/pages/whisky_page.dart';
import 'package:bootquim_soulbreja/widgets/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'carrinho_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//***************************************************************** */
//*************************************Imagens do Carousel *********/
final List<String> imagesList = [
  '../../assets/images/promocao/promoamstel.jpeg',
  '../../assets/images/promocao/promoserrana.jpg',
  '../../assets/images/promocao/promooriginal.jpg',
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
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => ListaPromocao()));
                    },
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
                        child: Text("Categorias", style: TextStyle(fontSize: 25),)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: InkWell(
                              child: Image.asset(
                                '../../assets/images/categorias/cervejas.jpg',
                                width: 80,
                              ),
                               onTap: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) => CervejaPage()));
                              },
                            ),
                          ),
                          Text("Cervejas")
                        ]),
                        Column(children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: InkWell(
                              child: Image.asset(
                                '../../assets/images/categorias/vinhos.jpg',
                                width: 80,
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) => VinhoPage()));
                              },
                            ),
                          ),
                          Text("Vinhos")
                        ]),
                        Column(children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: InkWell(
                              child: Image.asset(
                                '../../assets/images/categorias/whiskys.jpg',
                                width: 80,
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) => WhiskyPage()));
                              },
                            ),
                          ),
                          Text("whiskys")
                        ]),
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
