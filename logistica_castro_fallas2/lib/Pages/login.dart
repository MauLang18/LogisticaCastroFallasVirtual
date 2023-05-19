// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, camel_case_types, unused_element, sized_box_for_whitespace, prefer_final_fields, sort_child_properties_last

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/globales.dart';
import '../Widgets/bottom2.dart';

class Login3 extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<Login3> {
  TextEditingController _username = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool isLoading = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 200,
                left: -100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Color(0x304599ff),
                    borderRadius: BorderRadius.all(
                      Radius.circular(150),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: -10,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0x30cc33ff),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 80,
                    sigmaY: 80,
                  ),
                  child: Container(),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      _logo(),
                      const SizedBox(
                        height: 30,
                      ),
                      _loginLabel(),
                      const SizedBox(
                        height: 50,
                      ),
                      _labelTextInput(
                          "Email", "yourname@example.com", false, _username),
                      const SizedBox(
                        height: 30,
                      ),
                      _labelTextInput("Password", "yourpassword", true, _pass),
                      const SizedBox(
                        height: 70,
                      ),
                      _loginBtn(),
                      const SizedBox(
                        height: 90,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _signUpLabel(String label, Color textColor) {
    return Text(
      label,
      style: GoogleFonts.josefinSans(
        textStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _loginBtn() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xff008fff),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: () => {_login()},
        child: Text(
          "Login",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget _labelTextInput(
      String label, String hintText, bool isPassword, controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              color: Color(0xff8fa1b6),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          cursorColor: Colors.red,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                color: Color(0xffc5d2e1),
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffdfe8f3)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginLabel() {
    return Center(
      child: Text(
        "Login",
        style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
            color: Color(0xff164276),
            fontWeight: FontWeight.w900,
            fontSize: 34,
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: SizedBox(
        child: Image.asset("assets/icon/logo.png"),
        height: 150,
      ),
    );
  }

  Future<void> _login() async {
    if (_username.text.isNotEmpty && _pass.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      final docUser =
          FirebaseFirestore.instance.collection('user').doc(_username.text);
      final snapshot = await docUser.get();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      Future.delayed(Duration(seconds: 1), () {
        if (snapshot.exists) {
          return setState(() {
            Map<String, dynamic> map = snapshot.data()!;
            if (map['pass'] == _pass.text) {
              prefs.setBool('user1', true);
              prefs.setString('email1', _username.text);
              prefs.setString('code1', map['code']);
              prefs.setString('pass1', _pass.text);
              codigo = map['code'];
              email = _username.text;
              pass = _pass.text;

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Bottom2()),
              );
            } else {
              Fluttertoast.showToast(
                  msg: "Contraseña o Correo incorrectos",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.red,
                  textColor: Colors.black,
                  fontSize: 16.0);
            }
          });
        }
      });
    }
  }
}
