// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<HomePage> {
  late Size size;
  SharedPreferences? prefs;
  String? code;

  cargar() async {
    prefs = await SharedPreferences.getInstance();
    code = prefs!.getString('code1');
  }

  @override
  void initState() {
    cargar();
    super.initState();
  }

  Widget _logistica(
      {required String image, required String tittle, required String link}) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 310,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
          ),
          Container(
            height: 80,
            width: 310,
            decoration: const BoxDecoration(
                color: Color(0xfff1f1f1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tittle,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.info,
                        color: Colors.red,
                        size: 20,
                      ),
                      Container(
                        width: 260,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                  text: "Más información",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // ignore: deprecated_member_use
                                      launch(link);
                                    }),
                            ]))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey,
        leading: Padding(
          padding: const EdgeInsets.all(9),
          child: Center(
            child: Container(
              height: 95,
              width: 75,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/icon/icon.png'),
                  )),
            ),
          ),
        ),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login3()),
                );
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icon/user.png'),
                    )),
              ),
            ),
          ),
        ],
        title: const Text(
          "Logística Castro Fallas",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: Stack(
        children: [
          Container(
            child: CustomPaint(
              painter: ShapesPainter(),
              child: Container(
                height: size.height / 2,
              ),
            ),
          ),
          ListView(children: [
            Container(
              height: 760,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Logística Internacional",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _logistica(
                            image: "assets/images/lm.jpg",
                            tittle: "Logística Marítima",
                            link:
                                "https://www.logisticacastrofallas.com/logisticamaritima"),
                        _logistica(
                            image: "assets/images/la.jpg",
                            tittle: "Logística Aérea",
                            link:
                                "https://www.logisticacastrofallas.com/logisticaaerea"),
                        _logistica(
                            image: "assets/images/lt.jpg",
                            tittle: "Logística Terrestre",
                            link:
                                "https://www.logisticacastrofallas.com/logisticaterrestre"),
                      ],
                    ),
                  ),
                  const Text(
                    "Otros Servicios",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _logistica(
                            image: "assets/images/aduana.jpg",
                            tittle: "Agenciamiento Aduanal",
                            link:
                                "https://www.logisticacastrofallas.com/agenciamientoaduanal"),
                        _logistica(
                            image: "assets/images/almacen_gf.jpg",
                            tittle: "Almacén Fiscal-General",
                            link:
                                "https://www.logisticacastrofallas.com/almacenajefiscalgeneral"),
                        _logistica(
                            image: "assets/images/transporte.jpg",
                            tittle: "Transporte Local de Carga",
                            link:
                                "https://www.logisticacastrofallas.com/transportelocaldecarga"),
                        _logistica(
                            image: "assets/images/capacitacion.jpg",
                            tittle: "Asesorías y Capacitaciones",
                            link:
                                "https://www.logisticacastrofallas.com/asesorias-y-capacitaciones"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ],
      )),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the paint color to be white
    paint.color = Colors.white;
    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    paint.color = Colors.grey; //const Color.fromARGB(255, 08, 22, 162);
    // create a path
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    // close the path to form a bounded shape
    path.close();
    canvas.drawPath(path, paint);
    /* // set the color property of the paint
    paint.color = Colors.deepOrange;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);
    // draw the circle with center having radius 75.0
    canvas.drawCircle(center, 75.0, paint);*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
