// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, file_names, prefer_const_constructors, unnecessary_import, unused_import, use_key_in_widget_constructors, prefer_if_null_operators, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistica_castro_fallas2/Data/constantes.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PanamaScreen extends StatelessWidget {
  final String? idtra;
  final String? whs;
  final String? bodega;
  final String? pre_estado;
  final String? tracking;
  final String? factura;
  final String? po;
  final String? shipper;
  final String? bcf;
  final String? ingreso;
  final String? bultos;
  final String? tipo;
  final String? contenedor;
  final String? status;
  const PanamaScreen(
    this.idtra,
    this.whs,
    this.bodega,
    this.pre_estado,
    this.tracking,
    this.factura,
    this.po,
    this.shipper,
    this.bcf,
    this.ingreso,
    this.bultos,
    this.tipo,
    this.contenedor,
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
              child: Image.asset("assets/images/bodegas.jpg"),
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
                    idtra ?? "",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 10),
                  Text(
                    whs != null ? "WHS: " + whs! + " " + bodega! : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    contenedor != null ? "CONTENEDOR: " + contenedor! : "",
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
                    status ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FACTURA: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        factura ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TRACKING: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        tracking ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PO: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        po ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black),
                      ),
                    ],
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
                bcf != null ? "BL: " + bcf! : "",
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
                shipper ?? "",
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
                bultos != null ? "BULTOS: " + bultos! + " " + tipo! : "",
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
                ingreso != null ? "INGRESO A BODEGA: " + ingreso! : "",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
