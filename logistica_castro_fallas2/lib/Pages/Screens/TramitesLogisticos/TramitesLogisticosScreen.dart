// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, file_names, prefer_const_constructors, unnecessary_import, unused_import, use_key_in_widget_constructors, prefer_if_null_operators, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistica_castro_fallas2/Data/constantes.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TramitesLogisticosScreen extends StatelessWidget {
  final String? idtra;
  final String? pre_estado;
  final String? fecha;
  final String? status;
  final String? incoterm;
  final String? transporte;
  final String? origen;
  final String? destino;
  final String? bcf;
  final String? cantidadequipo;
  final String? tamanioequipo;
  final String? contenedor;
  final String? seal;
  final String? shipper;
  final String? bultos;
  final String? commodity;
  final String? factura;
  final String? po;
  final String? facturascf;
  final String? pol;
  final String? etd;
  final String? zarpe;
  final String? poe;
  final String? eta;
  final String? almacen;
  final String? ingreso;
  final String? buque;
  final String? viaje;
  final String? transito;
  const TramitesLogisticosScreen(
    this.idtra,
    this.pre_estado,
    this.fecha,
    this.status,
    this.incoterm,
    this.transporte,
    this.origen,
    this.destino,
    this.bcf,
    this.cantidadequipo,
    this.tamanioequipo,
    this.contenedor,
    this.seal,
    this.shipper,
    this.bultos,
    this.commodity,
    this.factura,
    this.po,
    this.facturascf,
    this.pol,
    this.etd,
    this.zarpe,
    this.poe,
    this.eta,
    this.almacen,
    this.ingreso,
    this.buque,
    this.viaje,
    this.transito,
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
              child: Image.asset("assets/images/tramiteslogisticos.jpg"),
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
                    idtra ?? "IDTRA",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 10),
                  Text(
                    bcf != null ? "BL: " + bcf! : "",
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
                    po != null ? "PO: " + po! : "",
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
                    status ?? "STATUS CLIENTE",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    fecha ?? "FECHA MODIFICACION",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    origen ?? "ORIGEN",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    destino ?? "DESTINO",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    transito != null ? "Días de Transito: " + transito! : "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(height: 4),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: 340,
                        height: 100,
                        child: TimelineTile(
                          alignment: TimelineAlign.center,
                          startChild: const Text("ETD"),
                          endChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(pol!), Text(etd!)],
                          ),
                          isFirst: true,
                          beforeLineStyle: const LineStyle(color: Colors.black),
                          indicatorStyle: const IndicatorStyle(
                              color: Colors.black, width: 25),
                          afterLineStyle: const LineStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: TimelineTile(
                          alignment: TimelineAlign.center,
                          startChild: const Text("Confirmación Zarpe"),
                          endChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  buque != null ? buque! + " / " + viaje! : ""),
                              Text(zarpe!)
                            ],
                          ),
                          beforeLineStyle: const LineStyle(color: Colors.black),
                          indicatorStyle: const IndicatorStyle(
                              color: Colors.black, width: 25),
                          afterLineStyle: const LineStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 175,
                        height: 100,
                        child: TimelineTile(
                          alignment: TimelineAlign.center,
                          startChild: const Text("Transito"),
                          endChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(zarpe!)],
                          ),
                          beforeLineStyle: const LineStyle(color: Colors.black),
                          indicatorStyle: const IndicatorStyle(
                              color: Colors.black, width: 25),
                          afterLineStyle: const LineStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 340,
                        height: 100,
                        child: TimelineTile(
                          alignment: TimelineAlign.center,
                          startChild: const Text("ETA"),
                          endChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(poe!), Text(eta!)],
                          ),
                          beforeLineStyle: const LineStyle(color: Colors.black),
                          indicatorStyle: const IndicatorStyle(
                              color: Colors.black, width: 25),
                          afterLineStyle: const LineStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 175,
                        height: 100,
                        child: TimelineTile(
                          alignment: TimelineAlign.center,
                          startChild: const Text("Entrega"),
                          endChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(almacen!), Text(ingreso!)],
                          ),
                          isLast: true,
                          beforeLineStyle: const LineStyle(color: Colors.black),
                          indicatorStyle: const IndicatorStyle(
                              color: Colors.black, width: 25),
                          afterLineStyle: const LineStyle(color: Colors.black),
                        ),
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
                incoterm ?? "INCOTERM",
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
                transporte ?? "TRANSPORTE",
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
                seal != null ? "SEAL: " + seal! : "",
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
                factura != null ? "#FACTURA: " + factura! : "",
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
                cantidadequipo != null ? "CANT.EQUIPO: " + cantidadequipo! : "",
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
                tamanioequipo ?? "TAMAÑO EQUIPO",
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
                bultos != null ? bultos! + " BULTOS" : "",
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
                shipper ?? "SHIPPER",
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
                commodity ?? "",
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
                facturascf != null ? "FACTURAS CF: " + facturascf! : "",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
