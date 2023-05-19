// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../Pages/cotizarPage.dart';
import '../Pages/homePage.dart';
import '../Pages/tarifariosPage.dart';
import '../Pages/contactosPage.dart';
import '../Pages/itinerariosPage.dart';
import '../Pages/trackingPage.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selected = 0;
  bool a = true;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const TrackingPage(),
    const ItinerarioPage(),
    const CotizarPage(),
    const TarifarioPage(),
    const ContactosPage()
  ];

  void _onItemtapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selected),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.red,
        color: Colors.black,
        activeColor: Colors.black,
        items: const [
          TabItem(icon: Icons.home, title: 'Inicio'),
          TabItem(icon: Icons.map, title: 'Tracking'),
          TabItem(icon: Icons.schedule, title: 'Itinerario'),
          TabItem(icon: Icons.dashboard_customize, title: 'Cotizar'),
          TabItem(icon: Icons.crop_landscape_outlined, title: 'Tarifario'),
          TabItem(icon: Icons.contacts, title: 'Contacto'),
        ],
        onTap: _onItemtapped,
      ),
    );
  }
}
