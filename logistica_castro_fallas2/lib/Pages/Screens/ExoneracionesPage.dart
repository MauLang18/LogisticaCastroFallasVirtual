// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, must_be_immutable, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/material.dart';
import 'dart:ui';

import '../profilePage.dart';
import 'Exoneraciones/ActivosE.dart';
import 'Exoneraciones/FinalizadosE.dart';

class ExoneracionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 26, 24, 24),
        ),
        child: Scaffold(
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
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Color(0xFF899CCF),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Exoneraciones",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Container(
                      height: 50,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Color(0xFF31314F),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 50,
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Buscar",
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TabBar(
                    isScrollable: true,
                    labelStyle: TextStyle(fontSize: 18),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 3,
                          color: Color(0xFF899CCF),
                        ),
                      ),
                    ),
                    tabs: [
                      Tab(text: "Activos"),
                      Tab(text: "Finalizados"),
                    ],
                    labelColor: Color(0xFF000000),
                  ),
                  Flexible(
                    flex: 1,
                    child: TabBarView(
                      children: [
                        ActivosE(),
                        FinalizadosE(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
