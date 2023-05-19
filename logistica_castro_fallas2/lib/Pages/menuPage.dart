// ignore_for_file: avoid_unnecessary_containers, file_names, library_private_types_in_public_api, prefer_const_constructors, unused_import, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/bottom3.dart';
import 'Screens/CertificadosPage.dart';
import 'Screens/CotizacionesPage.dart';
import 'Screens/ExoneracionesPage.dart';
import 'Screens/TramitesAduanalesPage.dart';
import 'Screens/TramitesLogisticosPage.dart';
import 'login.dart';
import 'profilePage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<MenuPage> {
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
                  MaterialPageRoute(builder: (context) => PerfilPage()),
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
      body: Stack(
        children: <Widget>[
          Container(
            child: CustomPaint(
              painter: ShapesPainter(),
              child: Container(
                height: size.height / 2,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  createGridItem(0),
                  createGridItem(1),
                  createGridItem(2),
                  createGridItem(3),
                  createGridItem(4),
                  createGridItem(5),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createGridItem(int position) {
    var color = Colors.white;
    var icondata = Icons.add;
    var texto = "";
    var navegacion;

    switch (position) {
      case 0:
        color = Color.fromARGB(255, 248, 45, 45);
        icondata = Icons.map;
        texto = "Tramites Logisticos";
        navegacion = TramitesLogisticosPage();
        break;
      case 1:
        color = Color.fromARGB(255, 27, 53, 114);
        icondata = Icons.list_alt;
        texto = "Tramites Aduanales";
        navegacion = TramitesAduanalesPage();
        break;
      case 2:
        color = Color.fromARGB(255, 167, 44, 44);
        icondata = Icons.gite;
        texto = "Cargas en Bodega";
        navegacion = Bottom3();
        break;
      case 3:
        color = Color.fromARGB(255, 47, 55, 207);
        icondata = Icons.attach_money_rounded;
        texto = "Cotizaciones";
        navegacion = CotizacionesPage();
        break;
      case 4:
        color = Color.fromARGB(255, 123, 16, 16);
        icondata = Icons.description;
        texto = "Certificados de Re-Exportación";
        navegacion = CertificadosPage();
        break;
      case 5:
        color = Color.fromARGB(255, 41, 89, 198);
        icondata = Icons.assignment_rounded;
        texto = "Exoneraciones";
        navegacion = ExoneracionesPage();
        break;
    }

    return Builder(builder: (context) {
      return Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
        child: Card(
          elevation: 10,
          color: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => navegacion));
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    icondata,
                    size: 40,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      texto,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
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
