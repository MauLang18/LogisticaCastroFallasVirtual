// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, file_names, prefer_const_constructors, unnecessary_import, unused_import, use_key_in_widget_constructors, prefer_if_null_operators, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistica_castro_fallas2/Data/constantes.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExoneracionesScreen extends StatelessWidget {
  final String? producto;
  final String? exoneracion;
  final String? idtra;
  final String? solicitud;
  final String? autorizacion;
  final String? hasta;
  final String? status;
  const ExoneracionesScreen(
    this.producto,
    this.exoneracion,
    this.idtra,
    this.solicitud,
    this.autorizacion,
    this.hasta,
    this.status,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/images/exoneraciones.jpg"),
            ),
            buttonArrow(context),
            scroll(),
          ],
        ),
      ),
    );
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    producto != null ? "PRODUCTO: " + producto! : "",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 10),
                  Text(
                    solicitud != null ? "SOLICITUD: " + solicitud! : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    autorizacion != null
                        ? "AUTORIZACION: " + autorizacion!
                        : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    status ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(height: 4),
                  ),
                  SizedBox(height: 5),
                  Text(
                    exoneracion != null
                        ? "Tipo de Exoneracion: " + exoneracion!
                        : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    hasta != null ? "Hasta: " + hasta! : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    idtra ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
