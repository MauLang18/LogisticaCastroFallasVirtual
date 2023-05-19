// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, file_names, prefer_const_constructors, unnecessary_import, unused_import, use_key_in_widget_constructors, prefer_if_null_operators, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistica_castro_fallas2/Data/constantes.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TarifasMercadoScreen extends StatelessWidget {
  final String? id;
  final String? revision;
  final String? oferta;
  final String? incoterm;
  final String? modo;
  final String? modalidad;
  final String? pol;
  final String? poe;
  final String? pod;
  final String? cantidad;
  final String? equipo;
  final String? desde;
  final String? hasta;
  final String? total;
  const TarifasMercadoScreen(
    this.id,
    this.revision,
    this.oferta,
    this.incoterm,
    this.modo,
    this.modalidad,
    this.pol,
    this.poe,
    this.pod,
    this.cantidad,
    this.equipo,
    this.desde,
    this.hasta,
    this.total,
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
              child: Image.asset("assets/images/cotizacion.png"),
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
                    id != null ? "ID: " + id! + " / " + revision! : "",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 10),
                  Text(
                    oferta != null ? "OFERTA: " + oferta! : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    incoterm ?? "INCOTERM",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    modo != null ? "MODO: " + modo! : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    modalidad != null ? "MODALIDAD: " + modalidad! : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(height: 4),
                  ),
                  SizedBox(height: 10),
                  Text(
                    desde != null ? "Desde: " + desde! : "",
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
                    total != null ? "Total : " + total! : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(height: 4),
                  ),
                  Text(
                    "OTROS DATOS",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 10),
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [datos(context)],
                  ),
                ],
              ),
            ),
          );
        });
  }

  datos(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFF31314F),
                    child: Icon(
                      Icons.directions_boat_filled_outlined,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "POL",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
              SizedBox(height: 5),
              Text(
                pol ?? "",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF31314F),
                child: Icon(
                  Icons.directions_boat_filled_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              Text(
                poe != null ? "POE: " + poe! : "",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF31314F),
                child: Icon(
                  Icons.directions_boat_filled_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              Text(
                pod != null ? "POD: " + pod! : "",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF31314F),
                child: Icon(
                  Icons.directions_boat_filled_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              Text(
                cantidad != null ? "Equipo: " + cantidad! + "x" + equipo! : "",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
