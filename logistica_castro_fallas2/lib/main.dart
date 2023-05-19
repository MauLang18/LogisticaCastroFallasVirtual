// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import '../Data/globales.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Widgets/bottom.dart';
import 'Widgets/bottom2.dart';

SharedPreferences? prefs;
String? a;
String? b;
String? c;
bool d = false;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialization(null);
  prefs = await SharedPreferences.getInstance();

  //prefs!.clear();
  if (prefs!.getBool('user1') == null) {
    prefs!.setBool('user1', false);
  }

  a = prefs!.getString('code1');

  b = prefs!.getString('email1');

  c = prefs!.getString('pass1');

  d = prefs!.getBool('user1')!;

  if (d != false) {
    codigo = a!;
    email = b!;
    pass = c!;
    //print(email);
  } else {
    codigo = "";
    email = "";
    pass = "";
  }

  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 2));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Logística Castro Fallas",
      theme: ThemeData(),
      home: menu(),
    );
  }
}

menu() {
  if (prefs!.getBool('user1') != false) {
    return Bottom2();
  } else {
    return Bottom();
  }
}
