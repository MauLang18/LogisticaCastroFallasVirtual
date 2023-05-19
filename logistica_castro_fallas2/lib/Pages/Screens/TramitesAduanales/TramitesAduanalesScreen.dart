// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, file_names, prefer_const_constructors, unnecessary_import, unused_import, use_key_in_widget_constructors, prefer_if_null_operators, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistica_castro_fallas2/Data/constantes.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TramitesAduanalesScreen extends StatelessWidget {
  final String? recibo;
  final String? pre_estado;
  final String? solicitud;
  final String? idtra;
  final String? factura1;
  final String? factura2;
  final String? factura3;
  final String? factura4;
  final String? factura5;
  final String? cantidadequipo;
  final String? tamanioequipo;
  final String? commodity;
  final String? exoneracion;
  final String? certificado;
  final String? permiso;
  const TramitesAduanalesScreen(
    this.recibo,
    this.pre_estado,
    this.solicitud,
    this.idtra,
    this.factura1,
    this.factura2,
    this.factura3,
    this.factura4,
    this.factura5,
    this.cantidadequipo,
    this.tamanioequipo,
    this.commodity,
    this.exoneracion,
    this.certificado,
    this.permiso,
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
              child: Image.asset("assets/images/aduanas.png"),
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
                    recibo != null ? "RECIBO: " + recibo! : "",
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
                    idtra ?? "IDTRA",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    pre_estado ?? "STATUS",
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
                    exoneracion != null
                        ? "Lleva Exoneración: " + exoneracion!
                        : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    certificado != null
                        ? "Lleva Certificado Origen: " + certificado!
                        : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    permiso != null ? "Lleva permisos: " + permiso! : "",
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
                factura1 != null ? "#Factura 1: " + factura1! : "",
                style: Theme.of(context).textTheme.bodyText2,
              ),
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
                factura2 != null ? "#Factura 2: " + factura2! : "",
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
                factura3 != null ? "#Factura 3: " + factura3! : "",
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
                factura4 != null ? "#Factura 4: " + factura4! : "",
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
                factura5 != null ? "#Factura 5: " + factura5! : "",
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
                cantidadequipo != null
                    ? "EQUIPO: " + cantidadequipo! + "x" + tamanioequipo!
                    : "",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
          SizedBox(height: 10),
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
                    "COMMODITY",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
              SizedBox(height: 5),
              Text(
                commodity ?? "COMMODITY",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
