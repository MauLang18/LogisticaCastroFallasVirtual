// ignore_for_file: prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter, file_names, prefer_if_null_operators, library_private_types_in_public_api, prefer_is_empty, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/globales.dart';
import 'TarifasMercadoScreen.dart';

class ActualesTM extends StatefulWidget {
  const ActualesTM({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<ActualesTM> {
  List<dynamic>? dataA;
  List<dynamic>? dataS;
  String ship = '';
  SharedPreferences? prefs;
  String? code;

  cargar() async {
    prefs = await SharedPreferences.getInstance();
    code = prefs!.getString('code');
  }

  Future fetchDataA() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://dynamicscf.azurewebsites.net/dynamics/listarTarifasMercadoS'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataA = map["value"];
      });
    }
  }

  Future fetchIdtra(String code1) async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://dynamicscf.azurewebsites.net/dynamics/ListarCaso?name=$code1'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataS = map["value"];

        if (dataS!.length == 0) {
          ship = "";
        } else {
          if (dataS![0]['title'] != null) {
            ship = dataS![0]['title'];
          } else {
            ship = "";
          }
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataA();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataA != null ? dataA!.length : 1,
      itemBuilder: (context, index) => Column(
        children: [
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(top: 15, right: 12, left: 5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFF30314D),
              borderRadius: BorderRadius.circular(10),
            ),
            child: dataA != null
                ? Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TarifasMercadoScreen(
                                dataA![index]['quotenumber'].toString(),
                                dataA![index]['revisionnumber'].toString(),
                                dataA![index]['name'],
                                incoterm(dataA![index]['freighttermscode']),
                                modo(dataA![index]['shippingmethodcode']),
                                modalidad(
                                    dataA![index]['new_modalidaddeenvio']),
                                dataA![index]['new_pol'],
                                dataA![index]['new_poe'],
                                dataA![index]['new_pod'],
                                dataA![index]['new_cantidadequipos'].toString(),
                                equipos(dataA![index]['new_equipo']),
                                formatDOB(dataA![index]['effectivefrom']),
                                formatDOB(dataA![index]['effectiveto']),
                                dataA![index]['new_total'].toString(),
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataA![index]['quotenumber'].toString() +
                                  " / " +
                                  dataA![index]['revisionnumber'].toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      dataA![index]['name'] != null
                                          ? dataA![index]['name']
                                          : " ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 6),
                                    ),
                                  ],
                                ),
                                Text(
                                  incoterm(dataA![index]['freighttermscode']),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                                Text(
                                  modo(dataA![index]['shippingmethodcode']),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                                Text(
                                  modalidad(
                                      dataA![index]['new_modalidaddeenvio']),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      dataA![index]['new_pol'] != null
                                          ? dataA![index]['new_pol']
                                          : " ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 6),
                                    ),
                                  ],
                                ),
                                Text(
                                  dataA![index]['new_poe'] != null
                                      ? dataA![index]['new_poe']
                                      : " ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                                Text(
                                  dataA![index]['new_pod'] != null
                                      ? dataA![index]['new_pod']
                                      : " ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                                Text(
                                  dataA![index]['new_cantidadequipos'] != null
                                      ? dataA![index]['new_cantidadequipos']
                                              .toString() +
                                          "/" +
                                          equipos(dataA![index]['new_equipo'])
                                      : " ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                              ],
                            ),
                            Text(
                              "Desde: " +
                                  formatDOB(dataA![index]['effectivefrom']),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 12),
                            ),
                            Text(
                              "Hasta: " +
                                  formatDOB(dataA![index]['effectiveto']),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              dataA![index]['new_total'] != null
                                  ? "Total: " +
                                      dataA![index]['new_total'].toString()
                                  : "",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  String tamanio(value) {
    switch (value) {
      case 100000003:
        return '20 Flack Rat';
      case 100000000:
        return '20STD';
      case 100000008:
        return '24"';
      case 100000004:
        return '40 Flack Rat';
      case 100000002:
        return '40HC';
      case 100000009:
        return '40NOR';
      case 100000001:
        return '40STD';
      case 100000010:
        return '45HC';
      case 100000007:
        return '48"';
      case 100000006:
        return '53"';
      case 100000005:
        return 'LCL';
      case 100000011:
        return 'OT (OPEN TOP)';
      default:
        return '';
    }
  }

  String equipos(value) {
    switch (value) {
      case 100000000:
        return 'LCL';
      case 100000001:
        return 'LTL';
      case 100000002:
        return '53" FTL';
      case 100000003:
        return '20 STD FCL';
      case 100000004:
        return '40 STD FCL';
      case 100000005:
        return '40 HC FCL';
      case 100000006:
        return '48" FTL';
      case 100000007:
        return '40 NOR FCL';
      case 100000008:
        return '40 REFF';
      case 100000009:
        return '8 TON FTL';
      case 100000010:
        return '24 TON FTL';
      case 100000011:
        return '40 STD FCL - 40 HC FCL';
      case 100000012:
        return '40 FLAT RACKS';
      case 100000013:
        return '20 STD - 40 STD - 40 HC FCL';
      case 100000014:
        return '45 HC FCL';
      case 100000015:
        return '40 OPEN TOP';
      case 100000016:
        return 'LOW BOY';
      default:
        return '';
    }
  }

  String incoterm(value) {
    switch (value) {
      case 100000000:
        return 'FOB-Franco Sobre Buque';
      case 12:
        return 'EXW-En Fabrica';
      case 14:
        return 'FCA-Franco Transportista';
      case 13:
        return 'FAS-Franco Costado Buque';
      case 4:
        return 'CIF-Coste, Seguro y Flete';
      case 3:
        return 'CFR-Coste y Flete';
      case 5:
        return 'CIP-Flete y SegurosPpagados Hasta';
      case 6:
        return 'CPT-Flete Pagado Hasta';
      case 7:
        return 'DAF-Fanco en Frontera';
      case 8:
        return 'DEQ-Franco Sobre Muelle';
      case 9:
        return 'DES-Franco EXSHIP';
      default:
        return '';
    }
  }

  String modo(value) {
    switch (value) {
      case 1:
        return 'Aereo';
      case 2:
        return 'DHL';
      case 4:
        return 'UPS';
      case 5:
        return 'Correo Postal';
      case 6:
        return 'Carga Completa';
      case 7:
        return 'Recogida a cargo del cliente';
      case 9:
        return 'Carretera';
      case 10:
        return 'Ferrocarril';
      case 11:
        return 'Maritimo';
      case 39:
        return 'Urgente';
      case 40:
        return 'SEUR';
      case 41:
        return 'MRW';
      case 42:
        return 'NACEX';
      case 43:
        return 'Grupaje';
      case 44:
        return 'Servicio a Domicilio';
      default:
        return '';
    }
  }

  String modalidad(value) {
    switch (value) {
      case 100000000:
        return 'CY-CY';
      case 100000001:
        return 'SD-CY';
      case 100000002:
        return 'CY-SD';
      case 100000003:
        return 'SD-SD';
      default:
        return "";
    }
  }

  String formatDOB(value) {
    switch (value) {
      case null:
        return "";
      case "":
        return "";
      default:
        var dateTime = DateFormat("yyyy-MM-dd").parse(value.toString());
        return DateFormat("d MMM yyyy").format(dateTime);
    }
  }

  String idtra(value) {
    if (value != null || value != "null") {
      fetchIdtra(value);
      return ship;
    } else {
      return "";
    }
  }
}
