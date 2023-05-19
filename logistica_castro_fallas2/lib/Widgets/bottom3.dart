// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
//import '../Pages/Screens/CostaRicaPage.dart';
import '../Pages/Screens/MiamiPage.dart';
import '../Pages/Screens/PanamaPage.dart';
import '../assets/icons.dart';

class Bottom3 extends StatefulWidget {
  const Bottom3({super.key});

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom3> {
  int _selected = 0;
  bool a = true;
  static final List<Widget> _widgetOptions = <Widget>[
    MiamiPage(),
    PanamaPage(),
    //CostaRicaPage(),
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
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              onTabChange: _onItemtapped,
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: MyFlutterApp.estados_unidos,
                  text: "Miami",
                ),
                GButton(
                  icon: MyFlutterApp.panama,
                  text: "Panamá",
                ),
                /*GButton(
                  icon: MyFlutterApp.costa_rica,
                  text: "Costa Rica",
                ),*/
              ],
            ),
          ),
        ));
  }
}
