// ignore_for_file: prefer_interpolation_to_compose_strings, library_private_types_in_public_api, file_names, sized_box_for_whitespace, unnecessary_string_interpolations, prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'login.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<TrackingPage> {
  List<dynamic>? data;
  String fName = '';
  String bcf = '';
  String contenedor = '';
  String buque = '';
  String arribo = '';
  String almacen = '';
  String bodega = '';
  String eta = '';
  String etd = '';
  String zarpe = '';
  String modificar = '';
  String ingreso = '';

  String statusC = '';
  String transporteC = '';
  String destinoC = '';
  String origenC = '';
  String polC = '';
  String poeC = '';
  TextEditingController fNameController = TextEditingController();
  List<String> termino = [
    "IDTRA",
    "# CONTENEDOR",
    "BCF",
  ];

  String? _termino;
  String termino_ = "";
  String ter = "";
  String term = "";

  SharedPreferences? prefs;
  String? code;

  cargar() async {
    prefs = await SharedPreferences.getInstance();
    code = prefs!.getString('code1');
  }

  Future idData() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://dynamicscf.azurewebsites.net/dynamics/listarId?name=$fName'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        data = map["value"];

        if (data?[0]['new_bcf'] == null) {
          bcf = '';
        }
        if (data?[0]['new_contenedor'] == null) {
          contenedor = '';
        }
        if (data?[0]['new_nombrebuque'] == null) {
          buque = '';
        }
        if (data?[0]['new_ingresoabodegas'] == null) {
          bodega = '';
        }
        if (data?[0]['new_ingreso'] == null) {
          almacen = '';
        }
        if (data?[0]['new_fechaavisoarrib'] == null) {
          arribo = '';
        }
        if (data?[0]['new_etd1'] == null) {
          etd = '';
        }
        if (data?[0]['new_eta'] == null) {
          eta = '';
        }
        if (data?[0]['new_confirmacinzarpe'] == null) {
          zarpe = '';
        }
        if (data?[0]['modifiedon'] == null) {
          modificar = '';
        }
        if ((data?[0]['new_ingreso'] == null) &&
            (data?[0]['new_ingresoabodegas'] == null)) {
          ingreso = '';
        } else if ((data?[0]['new_ingreso'] != null) &&
            (data?[0]['new_ingresoabodegas'] == null)) {
          ingreso = formatDOB(data![0]['new_ingreso']);
        } else if ((data?[0]['new_ingreso'] == null) &&
            (data?[0]['new_ingresoabodegas'] != null)) {
          ingreso = formatDOB(data![0]['new_ingresoabodegas']);
        }

        if (data?[0]['new_origen'] != null) {
          origen(data![0]['new_origen'].toString());
        }
        if (data?[0]['new_destino'] != null) {
          destino(data![0]['new_destino'].toString());
        }
        if (data?[0]['new_transporte'] != null) {
          transporte(data![0]['new_transporte'].toString());
        }
        if (data?[0]['new_poe'] != null) {
          poe(data![0]['new_poe'].toString());
        }
        if (data?[0]['new_pol'] != null) {
          pol(data![0]['new_pol'].toString());
        }
        if (data?[0]['new_preestado2'] != null) {
          status(data![0]['new_preestado2'].toString());
        }
      });
    }
  }

  Future bcfData() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://dynamicscf.azurewebsites.net/dynamics/listarBcf?name=$fName'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        data = map["value"];

        if (data?[0]['new_bcf'] == null) {
          bcf = '';
        }
        if (data?[0]['new_contenedor'] == null) {
          contenedor = '';
        }
        if (data?[0]['new_nombrebuque'] == null) {
          buque = '';
        }
        if (data?[0]['new_ingresoabodegas'] == null) {
          bodega = '';
        }
        if (data?[0]['new_ingreso'] == null) {
          almacen = '';
        }
        if (data?[0]['new_fechaavisoarrib'] == null) {
          arribo = '';
        }
        if (data?[0]['new_etd1'] == null) {
          etd = '';
        }
        if (data?[0]['new_eta'] == null) {
          eta = '';
        }
        if (data?[0]['new_confirmacinzarpe'] == null) {
          zarpe = '';
        }
        if (data?[0]['modifiedon'] == null) {
          modificar = '';
        }
        if ((data?[0]['new_ingreso'] == null) &&
            (data?[0]['new_ingresoabodegas'] == null)) {
          ingreso = '';
        } else if ((data?[0]['new_ingreso'] != null) &&
            (data?[0]['new_ingresoabodegas'] == null)) {
          ingreso = formatDOB(data![0]['new_ingreso']);
        } else if ((data?[0]['new_ingreso'] == null) &&
            (data?[0]['new_ingresoabodegas'] != null)) {
          ingreso = formatDOB(data![0]['new_ingresoabodegas']);
        }

        if (data?[0]['new_origen'] != null) {
          origen(data![0]['new_origen'].toString());
        }
        if (data?[0]['new_destino'] != null) {
          destino(data![0]['new_destino'].toString());
        }
        if (data?[0]['new_transporte'] != null) {
          transporte(data![0]['new_transporte'].toString());
        }
        if (data?[0]['new_poe'] != null) {
          poe(data![0]['new_poe'].toString());
        }
        if (data?[0]['new_pol'] != null) {
          pol(data![0]['new_pol'].toString());
        }
        if (data?[0]['new_preestado2'] != null) {
          status(data![0]['new_preestado2'].toString());
        }
      });
    }
  }

  Future contenedorData() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://dynamicscf.azurewebsites.net/dynamics/listarContenedor?name=$fName'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        data = map["value"];

        if (data?[0]['new_bcf'] == null) {
          bcf = '';
        }
        if (data?[0]['new_contenedor'] == null) {
          contenedor = '';
        }
        if (data?[0]['new_nombrebuque'] == null) {
          buque = '';
        }
        if (data?[0]['new_ingresoabodegas'] == null) {
          bodega = '';
        }
        if (data?[0]['new_ingreso'] == null) {
          almacen = '';
        }
        if (data?[0]['new_fechaavisoarrib'] == null) {
          arribo = '';
        }
        if (data?[0]['new_etd1'] == null) {
          etd = '';
        }
        if (data?[0]['new_eta'] == null) {
          eta = '';
        }
        if (data?[0]['new_confirmacinzarpe'] == null) {
          zarpe = '';
        }
        if (data?[0]['modifiedon'] == null) {
          modificar = '';
        }
        if ((data?[0]['new_ingreso'] == null) &&
            (data?[0]['new_ingresoabodegas'] == null)) {
          ingreso = '';
        } else if ((data?[0]['new_ingreso'] != null) &&
            (data?[0]['new_ingresoabodegas'] == null)) {
          ingreso = formatDOB(data![0]['new_ingreso']);
        } else if ((data?[0]['new_ingreso'] == null) &&
            (data?[0]['new_ingresoabodegas'] != null)) {
          ingreso = formatDOB(data![0]['new_ingresoabodegas']);
        }

        if (data?[0]['new_origen'] != null) {
          origen(data![0]['new_origen'].toString());
        }
        if (data?[0]['new_destino'] != null) {
          destino(data![0]['new_destino'].toString());
        }
        if (data?[0]['new_transporte'] != null) {
          transporte(data![0]['new_transporte'].toString());
        }
        if (data?[0]['new_poe'] != null) {
          poe(data![0]['new_poe'].toString());
        }
        if (data?[0]['new_pol'] != null) {
          pol(data![0]['new_pol'].toString());
        }
        if (data?[0]['new_preestado2'] != null) {
          status(data![0]['new_preestado2'].toString());
        }
      });
    }
  }

  @override
  void initState() {
    cargar();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  MaterialPageRoute(builder: (context) => Login3()),
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
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width / 40),
                      color: Colors.white,
                    ),
                    child: DropdownButtonFormField(
                      value: _termino,
                      onChanged: (value) {
                        setState(() {
                          _termino = value;
                        });

                        termino_ = _termino!;
                      },
                      items:
                          termino.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        hintText: "Elige una opción de busqueda",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: fNameController,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        hintText: 'Ingrese su $termino_',
                        label: Text(
                          termino_,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 3,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 3,
                            )),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                fName = fNameController.text;
                              });

                              term = termino_;

                              if (termino_ == "IDTRA") {
                                ter = "title";
                                idData();
                              } else if (termino_ == "BCF") {
                                ter = "new_bcf";
                                bcfData();
                              } else if (termino_ == "# CONTENEDOR") {
                                ter = "new_contenedor";
                                contenedorData();
                              }
                            },
                            icon:
                                const Icon(Icons.search, color: Colors.black))),
                  ),
                  const SizedBox(height: 25.0),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: data != null
                        ? Column(children: [
                            Container(
                                height: 275,
                                width: 400,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            "IDTRA: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            data![0]['title'],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        children: [
                                          const Text(
                                            "BCF: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            data![0]['new_bcf'] == null
                                                ? bcf
                                                : data![0]['new_bcf'],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              const Text(
                                                "# CONTENEDOR: ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                data![0]['new_contenedor'] ==
                                                        null
                                                    ? contenedor
                                                    : data![0]
                                                        ['new_contenedor'],
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            "STATUS: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            data![0]['new_preestado2']
                                                        .toString() ==
                                                    null
                                                ? data![0]['new_preestado2']
                                                    .toString()
                                                : statusC,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        children: [
                                          const Text(
                                            "Fecha de Modificación",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            data![0]['modifiedon'] == null
                                                ? bcf
                                                : formatDOB(
                                                    data![0]['modifiedon']),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            "ORIGEN: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            data![0]['new_origen'].toString() ==
                                                    null
                                                ? data![0]['new_origen']
                                                    .toString()
                                                : origenC,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        children: [
                                          const Text(
                                            "DESTINO: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            data![0]['new_destino']
                                                        .toString() ==
                                                    null
                                                ? data![0]['new_destino']
                                                    .toString()
                                                : destinoC,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(width: 10),
                                          Column(
                                            children: [
                                              const Text(
                                                "TRANSPORTE: ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                data![0]['new_transporte']
                                                            .toString() ==
                                                        null
                                                    ? data![0]['new_transporte']
                                                        .toString()
                                                    : transporteC,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ]))),
                            const SizedBox(height: 5),
                            Center(
                                child: Column(
                              children: [
                                SizedBox(
                                  width: 340,
                                  height: 100,
                                  child: TimelineTile(
                                    alignment: TimelineAlign.center,
                                    startChild: const Text("ETD"),
                                    endChild: Column(
                                      children: [
                                        Text(polC),
                                        data![0]['new_etd1'] == null
                                            ? Text(etd)
                                            : Text(formatDOB(data![0]
                                                    ['new_etd1']
                                                .toString()))
                                      ],
                                    ),
                                    isFirst: true,
                                    beforeLineStyle:
                                        const LineStyle(color: Colors.black),
                                    indicatorStyle: const IndicatorStyle(
                                        color: Colors.black, width: 25),
                                    afterLineStyle:
                                        const LineStyle(color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 100,
                                  child: TimelineTile(
                                    alignment: TimelineAlign.center,
                                    startChild:
                                        const Text("Confirmación Zarpe"),
                                    endChild: Column(
                                      children: [
                                        data![0]['new_nombrebuque'] == null
                                            ? Text(buque)
                                            : Text(data![0]['new_nombrebuque']),
                                        data![0]['new_confirmacinzarpe'] == null
                                            ? Text(zarpe)
                                            : Text(formatDOB(data![0]
                                                    ['new_confirmacinzarpe']
                                                .toString()))
                                      ],
                                    ),
                                    beforeLineStyle:
                                        const LineStyle(color: Colors.black),
                                    indicatorStyle: const IndicatorStyle(
                                        color: Colors.black, width: 25),
                                    afterLineStyle:
                                        const LineStyle(color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 175,
                                  height: 100,
                                  child: TimelineTile(
                                    alignment: TimelineAlign.center,
                                    startChild: const Text("Aviso Arribo"),
                                    endChild:
                                        data![0]['new_instcliente'] == null
                                            ? Text(arribo)
                                            : Text(formatDOB(data![0]
                                                    ['new_instcliente']
                                                .toString())),
                                    beforeLineStyle:
                                        const LineStyle(color: Colors.black),
                                    indicatorStyle: const IndicatorStyle(
                                        color: Colors.black, width: 25),
                                    afterLineStyle:
                                        const LineStyle(color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 340,
                                  height: 100,
                                  child: TimelineTile(
                                    alignment: TimelineAlign.center,
                                    startChild: const Text("ETA"),
                                    endChild: Column(
                                      children: [
                                        Text(poeC),
                                        data![0]['new_eta'] == null
                                            ? Text(eta)
                                            : Text(formatDOB(
                                                data![0]['new_eta'].toString()))
                                      ],
                                    ),
                                    beforeLineStyle:
                                        const LineStyle(color: Colors.black),
                                    indicatorStyle: const IndicatorStyle(
                                        color: Colors.black, width: 25),
                                    afterLineStyle:
                                        const LineStyle(color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 175,
                                  height: 100,
                                  child: TimelineTile(
                                    alignment: TimelineAlign.center,
                                    startChild: const Text("Entrega"),
                                    endChild: Text(ingreso),
                                    isLast: true,
                                    beforeLineStyle:
                                        const LineStyle(color: Colors.black),
                                    indicatorStyle: const IndicatorStyle(
                                        color: Colors.black, width: 25),
                                    afterLineStyle:
                                        const LineStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ))
                          ])
                        : const CircularProgressIndicator(),
                  ))
                ],
              ))),
    );
  }

  void status(String status) {
    switch (status) {
      case '100000008':
        statusC = 'Facturación';
        break;
      case '100000014':
        statusC = 'Pre-Alerta';
        break;
      case '100000023':
        statusC = 'Archivado Gerencia';
        break;
      case '100000022':
        statusC = 'Archivado CAJA';
        break;
      case '100000021':
        statusC = 'Cancelado';
        break;
      case '100000020':
        statusC = 'Comisión Pendiente';
        break;
      case '100000019':
        statusC = 'Disputa';
        break;
      case '100000012':
        statusC = 'Tramite Vinculado';
        break;
      case '100000000':
        statusC = 'Coordinación Origen';
        break;
      case '100000013':
        statusC = 'Coordinación Origen Miami';
        break;
      case '100000015':
        statusC = 'Carga Bodega Miami';
        break;
      case '100000016':
        statusC = 'Esperando Factura';
        break;
      case '100000001':
        statusC = 'Booking Listo';
        break;
      case '100000017':
        statusC = 'Preparando Envio';
        break;
      case '100000002':
        statusC = 'En Transito';
        break;
      case '100000003':
        statusC = 'Carga en Pto. Entrada';
        break;
      case '100000004':
        statusC = 'Carga en Almacen DESTINO';
        break;
      case '100000005':
        statusC = 'Tramite Aduanas';
        break;
      case '100000006':
        statusC = 'Pago Pendiente';
        break;
      case '100000018':
        statusC = 'Ruta Entrega';
        break;
      case '100000007':
        statusC = 'Colocación CRC';
        break;
      case '100000009':
        statusC = 'Pre-Revisión';
        break;
      case '100000010':
        statusC = 'Archivado';
        break;
      case '100000011':
        statusC = 'Finalizado';
        break;
      case '100000024':
        statusC = 'Movimiento Panamá to CRC';
        break;
      case '100000025':
        statusC = 'Carga Bodega CFS Panamá';
        break;
      case '100000026':
        statusC = 'Carga en Bodega HUB Panamá';
        break;
      default:
        statusC = '';
    }
  }

  void origen(String origen) {
    switch (origen) {
      case '100000000':
        origenC = 'Estados Unidos';
        break;
      case '100000003':
        origenC = 'Thailandia';
        break;
      case '100000001':
        origenC = 'China';
        break;
      case '100000020':
        origenC = 'Alemania';
        break;
      case '100000033':
        origenC = 'Argentina';
        break;
      case '100000035':
        origenC = 'Bangladesh';
        break;
      case '100000027':
        origenC = 'Brasil';
        break;
      case '100000017':
        origenC = 'Canadá';
        break;
      case '100000006':
        origenC = 'Chile';
        break;
      case '100000007':
        origenC = 'Colombia';
        break;
      case '100000008':
        origenC = 'Costa Rica';
        break;
      case '100000005':
        origenC = 'Ecuador';
        break;
      case '100000030':
        origenC = 'Emiratos Arabes';
        break;
      case '100000013':
        origenC = 'España';
        break;
      case '100000023':
        origenC = 'Francia';
        break;
      case '100000002':
        origenC = 'Guatemala';
        break;
      case '100000016':
        origenC = 'Holanda';
        break;
      case '100000004':
        origenC = 'India';
        break;
      case '100000034':
        origenC = 'Indonesia';
        break;
      case '100000010':
        origenC = 'Italia';
        break;
      case '100000032':
        origenC = 'Japon';
        break;
      case '100000011':
        origenC = 'Korea';
        break;
      case '100000009':
        origenC = 'Mexico';
        break;
      case '100000021':
        origenC = 'Nicaragua';
        break;
      case '100000018':
        origenC = 'Panamá';
        break;
      case '100000024':
        origenC = 'Perú';
        break;
      case '100000029':
        origenC = 'Polonia';
        break;
      case '100000022':
        origenC = 'Portugal';
        break;
      case '100000019':
        origenC = 'Salvador';
        break;
      case '100000014':
        origenC = 'San José, Costa Rica';
        break;
      case '100000026':
        origenC = 'Sudáfrica';
        break;
      case '100000031':
        origenC = 'Suiza';
        break;
      case '100000028':
        origenC = 'Taiwán';
        break;
      case '100000012':
        origenC = 'Turquía';
        break;
      case '100000015':
        origenC = 'Vietnam';
        break;
      default:
        origenC = '';
    }
  }

  void destino(String destino) {
    switch (destino) {
      case '100000000':
        destinoC = 'San José, Costa Rica';
        break;
      case '100000001':
        destinoC = 'Pto. Moin, Costa Rica';
        break;
      case '100000002':
        destinoC = 'Pto. Caldera, Costa Rica';
        break;
      case '100000003':
        destinoC = 'Cartago, Costa Rica';
        break;
      case '100000004':
        destinoC = 'Guatemala City, Guatemala';
        break;
      case '100000005':
        destinoC = 'Santa Tecla, La Libertad, El Salvador';
        break;
      case '100000017':
        destinoC = 'Alemania';
        break;
      case '100000039':
        destinoC = 'Australia';
        break;
      case '100000021':
        destinoC = 'Buenaventura, Colombia';
        break;
      case '100000030':
        destinoC = 'Cartago, Costa Rica';
        break;
      case '100000037':
        destinoC = 'Chile';
        break;
      case '100000018':
        destinoC = 'Ciudad de Panama, Panama';
        break;
      case '100000020':
        destinoC = 'Colombia';
        break;
      case '100000010':
        destinoC = 'Colon, Panama';
        break;
      case '100000015':
        destinoC = 'Comalapa, La Paz';
        break;
      case '100000024':
        destinoC = 'El Salvador';
        break;
      case '100000022':
        destinoC = 'España';
        break;
      case '100000012':
        destinoC = 'Guapiles, Costa Rica';
        break;
      case '100000008':
        destinoC = 'Heredia, Costa Rica';
        break;
      case '100000025':
        destinoC = 'Honduras';
        break;
      case '100000019':
        destinoC = 'Managua, Nicaragua';
        break;
      case '100000032':
        destinoC = 'Mexico';
        break;
      case '100000006':
        destinoC = 'Miami, CFS';
        break;
      case '100000023':
        destinoC = 'Miami, USA';
        break;
      case '100000031':
        destinoC = 'Nicaragua';
        break;
      case '100000036':
        destinoC = 'Panama';
        break;
      case '100000040':
        destinoC = 'Paraguay';
        break;
      case '100000016':
        destinoC = 'Peru';
        break;
      case '100000014':
        destinoC = 'Pto, Acajutla, El Salvador';
        break;
      case '100000011':
        destinoC = 'Pto. Quetzal, Guatemala';
        break;
      case '100000035':
        destinoC = 'Puerto Cabello, Venezuela';
        break;
      case '100000009':
        destinoC = 'Puerto Maracaibo, Venezuela';
        break;
      case '100000033':
        destinoC = 'Puerto Rico';
        break;
      case '100000007':
        destinoC = 'Puerto Rico';
        break;
      case '100000029':
        destinoC = 'Republica Dominicana';
        break;
      case '100000026':
        destinoC = 'San Pedro Sula, Honduras';
        break;
      case '100000028':
        destinoC = 'San Salvador, El Salvador';
        break;
      case '100000013':
        destinoC = 'San Salvador, El Salvador';
        break;
      case '100000034':
        destinoC = 'Singapur';
        break;
      case '100000027':
        destinoC = 'Tegucigalga, Honduras';
        break;
      case '100000038':
        destinoC = 'Zona Libre, Colon, Panama';
        break;
      default:
        destinoC = '';
    }
  }

  void transporte(String transporte) {
    switch (transporte) {
      case '100000000':
        transporteC = 'Aéreo';
        break;
      case '100000001':
        transporteC = 'Marítimo';
        break;
      case '100000002':
        transporteC = 'Terrestre';
        break;
      default:
        transporteC = '';
    }
  }

  void pol(String pol) {
    switch (pol) {
      case '100000115':
        polC = 'Aeropuerto de Roma-Fiumicino';
        break;
      case '100000118':
        polC =
            'Aeropuesto Internacional de El Salvador San Óscar Arnulfo Romero y Galdámez';
        break;
      case '100000108':
        polC = 'Alajuela, Costa Rica';
        break;
      case '100000052':
        polC = 'Alemania';
        break;
      case '100000124':
        polC = 'Algeciras, España';
        break;
      case '100000042':
        polC = 'Altamira, Mexico';
        break;
      case '100000123':
        polC = 'Antwerp, Belgica';
        break;
      case '100000085':
        polC = 'Arkansas, USA';
        break;
      case '100000049':
        polC = 'Balboa, Panamá';
        break;
      case '100000125':
        polC = 'Baltimore(Maryland), Estados Unidos';
        break;
      case '100000006':
        polC = 'Bangkok, TH';
        break;
      case '100000091':
        polC = 'Barcelona, España';
        break;
      case '100000084':
        polC = 'Barraquilla, Colombia';
        break;
      case '100000080':
        polC = 'BROOKLYN NY, USA';
        break;
      case '100000017':
        polC = 'Buenaventura, Colombia';
        break;
      case '100000002':
        polC = 'Busan, Korea';
        break;
      case '100000063':
        polC = 'Callao, Peru';
        break;
      case '100000040':
        polC = 'Cartagena, Colombia';
        break;
      case '100000107':
        polC = 'Cartago, Costa Rica';
        break;
      case '100000061':
        polC = 'Charles de Gaulle, Paris';
        break;
      case '100000070':
        polC = 'Charleston, USA';
        break;
      case '100000097':
        polC = 'Chennai, India';
        break;
      case '100000122':
        polC = 'Chittagong, Bangladesh';
        break;
      case '100000095':
        polC = 'Chongqing, China';
        break;
      case '100000038':
        polC = 'Ciudad de Guatemala, Guatemala';
        break;
      case '100000114':
        polC = 'Colon Free Zone, Panama';
        break;
      case '100000012':
        polC = 'Dalian, China';
        break;
      case '100000104':
        polC = 'Dubai, Emiratos Arabes';
        break;
      case '100000073':
        polC = 'Burban, Sudafrica';
        break;
      case '100000003':
        polC = 'Escuintla, Guatemala';
        break;
      case '100000037':
        polC = 'Foshan, China';
        break;
      case '100000065':
        polC = 'Fuzhou, China';
        break;
      case '100000079':
        polC = 'Galveston TX, USA';
        break;
      case '100000039':
        polC = 'Gabze, Turquía';
        break;
      case '100000033':
        polC = 'Genoa, Italia';
        break;
      case '100000021':
        polC = 'Guangzhou, China';
        break;
      case '100000031':
        polC = 'Guayaquil, Ecuador';
        break;
      case '100000088':
        polC = 'Gydnia, Polonia';
        break;
      case '100000116':
        polC = 'Halifax, NS';
        break;
      case '100000109':
        polC = 'Heredia, Costa Rica';
        break;
      case '100000045':
        polC = 'Ho Chi Minh, Vietnam';
        break;
      case '100000077':
        polC = 'Hong Kong, China';
        break;
      case '100000069':
        polC = 'Houlka, MS, USA';
        break;
      case '100000022':
        polC = 'Houston, TX';
        break;
      case '100000064':
        polC = 'Huangpu, China';
        break;
      case '100000098':
        polC = 'ILLINOIS, USA';
        break;
      case '100000102':
        polC = 'JACKSONVILLE, FL';
        break;
      case '100000117':
        polC = 'Jakarta, Indonesia';
        break;
      case '100000120':
        polC = 'La Bruffière, Francia';
        break;
      case '100000009':
        polC = 'Laem Chabang, TH';
        break;
      case '100000062':
        polC = 'Le Havre, Francia';
        break;
      case '100000071':
        polC = 'Lianyungang, China';
        break;
      case '100000059':
        polC = 'Lisboa, Portugal';
        break;
      case '100000112':
        polC = 'Livorno, Italia';
        break;
      case '100000010':
        polC = 'Los Angeles, United States';
        break;
      case '100000058':
        polC = 'Managua, Nicaragua';
        break;
      case '100000096':
        polC = 'Manatee, USA';
        break;
      case '100000032':
        polC = 'Manzanillo, Mexico';
        break;
      case '100000093':
        polC = 'Manzanillo, Panama';
        break;
      case '100000048':
        polC = 'Mersin, Turquia';
        break;
      case '100000035':
        polC = 'Mexico, City';
        break;
      case '100000101':
        polC = 'MIAMI AIRPORT';
        break;
      case '100000005':
        polC = 'Miami, USA';
        break;
      case '100000090':
        polC = 'Milano, Italia';
        break;
      case '100000011':
        polC = 'Mundra, Guajarat, India';
        break;
      case '100000056':
        polC = 'Nanjin, China';
        break;
      case '100000066':
        polC = 'Nanjing, China';
        break;
      case '100000020':
        polC = 'Nansha, China';
        break;
      case '100000023':
        polC = 'New Jersey, USA';
        break;
      case '100000028':
        polC = 'New York, Estados Unidos';
        break;
      case '100000024':
        polC = 'Nhava Sheva, India';
        break;
      case '100000015':
        polC = 'Ningbo, China';
        break;
      case '100000121':
        polC = 'Norfolk, USA';
        break;
      case '100000004':
        polC = 'Nueva Esperanza, Guatemala';
        break;
      case '100000030':
        polC = 'Oakland, Estados Unidos';
        break;
      case '100000087':
        polC = 'Ohio, USA';
        break;
      case '100000105':
        polC = 'Patli, India';
        break;
      case '100000072':
        polC = 'PEARSON INTERNATIONATIONAL APT/TORONTO, Canada';
        break;
      case '100000076':
        polC = 'Pennsylvania, USA';
        break;
      case '100000054':
        polC = 'Peñas Blancas, Costa Rica';
        break;
      case '100000083':
        polC = 'Philadelphia, USA';
        break;
      case '100000008':
        polC = 'Port Everglades, Florida';
        break;
      case '100000089':
        polC = 'PORT HUENEME, USA';
        break;
      case '100000050':
        polC = 'Pto. Acajutla, El Salvador';
        break;
      case '100000051':
        polC = 'Pto. Quetzal, Guatemala';
        break;
      case '100000126':
        polC = 'Puerto Barrios, Guatemala';
        break;
      case '100000027':
        polC = 'Puerto Limón, Costa Rica';
        break;
      case '100000036':
        polC = 'Puerto Moin, CRC';
        break;
      case '100000092':
        polC = 'Puerto Rama, Nicaragua';
        break;
      case '100000001':
        polC = 'Qingdao, China';
        break;
      case '100000068':
        polC = 'Randleman, NC, USA';
        break;
      case '100000046':
        polC = 'Rotterdam, Netherlands';
        break;
      case '100000029':
        polC = 'San Francisco, Estados Unidos';
        break;
      case '100000110':
        polC = 'San José, Costa Rica';
        break;
      case '100000067':
        polC = 'San Pedro Sula, Honduras';
        break;
      case '100000074':
        polC = 'Santos, Brasil';
        break;
      case '100000019':
        polC = 'Savannah, GA';
        break;
      case '100000026':
        polC = 'Shanghái, China';
        break;
      case '100000018':
        polC = 'Shantou, China';
        break;
      case '100000043':
        polC = 'Shekou, China';
        break;
      case '100000014':
        polC = 'Shenzhen, China';
        break;
      case '100000111':
        polC = 'Shimizu, Japón';
        break;
      case '100000053':
        polC = 'SJO, Costa Rica';
        break;
      case '100000106':
        polC = 'Suiza';
        break;
      case '100000081':
        polC = 'Taichung, Taiwan';
        break;
      case '100000007':
        polC = 'Taizhou, China';
        break;
      case '100000055':
        polC = 'Tarragona, España';
        break;
      case '100000099':
        polC = 'Tennessee, USA';
        break;
      case '100000057':
        polC = 'Terminal SJO, Costa Rica';
        break;
      case '100000078':
        polC = 'Texas, U.S.A';
        break;
      case '100000082':
        polC = 'VADO LIGURE, Italia';
        break;
      case '100000041':
        polC = 'Valencia, España';
        break;
      case '100000000':
        polC = 'Valparaiso, Chile';
        break;
      case '100000047':
        polC = 'Vancouver, Canadá';
        break;
      case '100000075':
        polC = 'Veracruz, México';
        break;
      case '100000086':
        polC = 'VLISSINGEN, Países Bajos';
        break;
      case '100000103':
        polC = 'Wilmington, United States';
        break;
      case '100000094':
        polC = 'Winnipeg Airport, Canadá';
        break;
      case '100000016':
        polC = 'Xiamen, China';
        break;
      case '100000060':
        polC = 'Xingang, China';
        break;
      case '100000013':
        polC = 'Yantian, China';
        break;
      case '100000025':
        polC = 'Yichang, China';
        break;
      default:
        polC = '';
    }
  }

  void poe(String poe) {
    switch (poe) {
      case '100000054':
        poeC = 'Aeropuerto Internacional de Tocumen';
        break;
      case '100000048':
        poeC = 'Aeropuerto Internacional La Aurora, Guatemala';
        break;
      case '100000050':
        poeC = 'Aeropuerto Internacional Monseñor Oscar A. Romero, El Salvador';
        break;
      case '100000014':
        poeC = 'Alemania';
        break;
      case '100000020':
        poeC = 'Buenaventura, Colombia';
        break;
      case '100000051':
        poeC = 'Bugaba, Panamá';
        break;
      case '100000013':
        poeC = 'Callao, Perú';
        break;
      case '100000053':
        poeC = 'Cartagena, Colombia';
        break;
      case '100000015':
        poeC = 'Ciudad de Panamá, Panamá';
        break;
      case '100000009':
        poeC = 'Colon Free Zone, Panamá';
        break;
      case '100000041':
        poeC = 'Cristobal, Panamá';
        break;
      case '100000052':
        poeC = 'David Panamá';
        break;
      case '100000028':
        poeC = 'El Amatillo, El Salvador';
        break;
      case '100000043':
        poeC = 'Ensenada, Mexico';
        break;
      case '100000025':
        poeC = 'Guasale, Honduras';
        break;
      case '100000023':
        poeC = 'Honduras';
        break;
      case '100000055':
        poeC = 'La Asuncion Paraguay';
        break;
      case '100000024':
        poeC = 'Las Manos, Honduras';
        break;
      case '100000021':
        poeC = 'Madrid, España';
        break;
      case '100000016':
        poeC = 'Managua, Nicaragua';
        break;
      case '100000033':
        poeC = 'Manzanillo, Mexico';
        break;
      case '100000010':
        poeC = 'Manzanillo, Panamá';
        break;
      case '100000022':
        poeC = 'Miami, U.S.A';
        break;
      case '100000047':
        poeC = 'Paso Canoas, Costa Rica';
        break;
      case '100000019':
        poeC = 'Pedro Alvarado, Guatemala';
        break;
      case '100000003':
        poeC = 'Peñas Blancas, CR';
        break;
      case '100000017':
        poeC = 'Peñas Blancas, Nicaragua';
        break;
      case '100000056':
        poeC = 'Port Bridgetown, Barbados';
        break;
      case '100000007':
        poeC = 'Pt Everglades, Estados Unidos';
        break;
      case '100000006':
        poeC = 'Pto. Acajutla, El Salvador';
        break;
      case '100000011':
        poeC = 'Pto. Balboa, Panamá';
        break;
      case '100000001':
        poeC = 'Pto. Caldera, Costa Rica';
        break;
      case '100000005':
        poeC = 'Pto. Quetzal, Guatemala';
        break;
      case '100000045':
        poeC = 'Pto. Rama, Nicaragua';
        break;
      case '100000037':
        poeC = 'Puerto Cabello, Venezuela';
        break;
      case '100000046':
        poeC = 'Puerto Caucedo, Republica Dominicana';
        break;
      case '100000032':
        poeC = 'Puerto Corinto, Nicaragua';
        break;
      case '100000031':
        poeC = 'Puerto Cortes, Honduras';
        break;
      case '100000002':
        poeC = 'Puerto Limón, CR';
        break;
      case '100000012':
        poeC = 'Puerto Maracaibo, Venezuela';
        break;
      case '100000004':
        poeC = 'Puerto Moin, CR';
        break;
      case '100000034':
        poeC = 'Puerto Santo Tomás de Castilla, Guatemala';
        break;
      case '100000049':
        poeC = 'Qantas Drive, Eagle Farm, Australia';
        break;
      case '100000030':
        poeC = 'Rio Haina, Republica Dominicana';
        break;
      case '100000042':
        poeC = 'Rodman, Panamá';
        break;
      case '100000040':
        poeC = 'San Antonio, Chile';
        break;
      case '100000018':
        poeC = 'San Cristobal, Guatemala';
        break;
      case '100000039':
        poeC = 'San José, Costa Rica';
        break;
      case '100000035':
        poeC = 'San Juan, Puerto Rico';
        break;
      case '100000008':
        poeC = 'San Juan, Puerto Rico';
        break;
      case '100000027':
        poeC = 'San Pedro Sula, Honduras';
        break;
      case '100000029':
        poeC = 'San Salvador, El Salvador';
        break;
      case '100000044':
        poeC = 'Santo Domingo, RD';
        break;
      case '100000036':
        poeC = 'Singapore Changi Airport, Singapure';
        break;
      case '100000026':
        poeC = 'Tegucipalpa, Honduras';
        break;
      case '100000000':
        poeC = 'Terminal SJO, CR';
        break;
      case '100000038':
        poeC = 'Zona Libre, Colon, Panamá';
        break;
      default:
        poeC = '';
    }
  }

  String formatDOB(value) {
    var dateTime = DateFormat("yyyy-MM-dd").parse(value.toString());
    return DateFormat("d MMM yyyy").format(dateTime);
  }
}
