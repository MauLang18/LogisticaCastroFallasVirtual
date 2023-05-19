// ignore_for_file: prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter, file_names, prefer_if_null_operators, library_private_types_in_public_api, prefer_is_empty

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/globales.dart';
import 'TramitesAduanalesScreen.dart';

class FinalizadosTA extends StatefulWidget {
  const FinalizadosTA({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FinalizadosTA> {
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
        'https://dynamicscf.azurewebsites.net/dynamics/ListarTramitesAduanalesF?name=$codigo'));
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
                      Column(
                        children: [
                          Text(
                            dataA![index]['name'],
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            dataA![index]['new_solicitud'] != null
                                ? dataA![index]['new_solicitud']
                                : " ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TramitesAduanalesScreen(
                                dataA![index]['name'],
                                preestado(dataA![index]['new_statusaduanal']),
                                dataA![index]['new_solicitud'],
                                idtra(dataA![index]['_new_idtra_value']
                                    .toString()),
                                factura1(dataA![index]['new_facturac1'],
                                    dataA![index]['new_facturac12']),
                                factura2(dataA![index]['new_facturac2'],
                                    dataA![index]['new_facturac22']),
                                factura3(dataA![index]['new_facturac3'],
                                    dataA![index]['new_facturac32']),
                                factura4(dataA![index]['new_facturac4'],
                                    dataA![index]['new_facturac42']),
                                factura5(dataA![index]['new_facturac5'],
                                    dataA![index]['new_facturac52']),
                                cantidad(dataA![index]['new_cantequipo'],
                                    dataA![index]['new_cantequip2']),
                                tamanios(dataA![index]['new_tamaoequipo'],
                                    dataA![index]['new_tamaoequipo2']),
                                commodity(dataA![index]['new_commodity'],
                                    dataA![index]['new_commodity2']),
                                exoneracion(
                                    dataA![index]['new_llevaexoneracion'],
                                    dataA![index]['new_llevaexoneracion2']),
                                certificado(
                                    dataA![index]
                                        ['new_aplicacertificadodeorigen'],
                                    dataA![index]
                                        ['new_aplicacertificadodeorigen2']),
                                permisos(dataA![index]['new_llevapermisos'],
                                    dataA![index]['new_llevapermisos2']),
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              preestado(dataA![index]['new_statusaduanal']),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
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

  String preestado(value) {
    switch (value) {
      case 100000000:
        return 'Recibo Creado / Pendiente Asignar Pedimentador';
      case 100000001:
        return 'Pendiente Documentos Originales';
      case 100000002:
        return 'Pendiente Calculo Impuestos';
      case 100000003:
        return 'Pendiente Permisos';
      case 100000004:
        return 'Pendiente Exoneraciones';
      case 100000005:
        return 'Pendiente Cotización';
      case 100000006:
        return 'Pendiente Pago Cotización';
      case 100000007:
        return 'Pendiente DUA';
      case 100000008:
        return 'Pendiente Aforo / DUA';
      case 100000009:
        return 'Pendiente Entrega';
      case 100000010:
        return 'DUA Listo';
      case 100000011:
        return 'Facturación';
      case 100000012:
        return 'Archivado Gerencia';
      case 100000013:
        return 'Archivado CAJA';
      default:
        return '';
    }
  }

  String cantidadE(value) {
    switch (value) {
      case 100000008:
        return 'LCL';
      case 100000000:
        return '1';
      case 100000001:
        return '2';
      case 100000003:
        return '3';
      case 100000002:
        return '4';
      case 100000004:
        return '5';
      case 100000005:
        return '6';
      case 100000006:
        return '7';
      case 100000007:
        return '8';
      default:
        return '';
    }
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

  String exoneracion(value, value2) {
    if ((value == false) && (value2 == false)) {
      return 'No';
    } else if ((value != false) && (value2 == false)) {
      return 'Sí';
    } else if ((value == false) && (value2 != false)) {
      return 'Sí';
    } else {
      return "";
    }
  }

  String certificado(value, value2) {
    if ((value == false) && (value2 == false)) {
      return 'No';
    } else if ((value != false) && (value2 == false)) {
      return 'Sí';
    } else if ((value == false) && (value2 != false)) {
      return 'Sí';
    } else {
      return "";
    }
  }

  String permisos(value, value2) {
    if ((value == false) && (value2 == false)) {
      return 'No';
    } else if ((value != false) && (value2 == false)) {
      return 'Sí';
    } else if ((value == false) && (value2 != false)) {
      return 'Sí';
    } else {
      return "";
    }
  }

  String cantidad(value, value2) {
    if ((value == null) && (value2 == null)) {
      return '';
    } else if ((value != null) && (value2 == null)) {
      return value;
    } else if ((value == null) && (value2 != null)) {
      return value2;
    } else {
      return "";
    }
  }

  String tamanios(value, value2) {
    if ((value == null) && (value2 == null)) {
      return '';
    } else if ((value != null) && (value2 == null)) {
      return value;
    } else if ((value == null) && (value2 != null)) {
      return value2;
    } else {
      return "";
    }
  }

  String factura1(value, value2) {
    if ((value == null) && (value2 == null)) {
      return '';
    } else if ((value != null) && (value2 == null)) {
      return value;
    } else if ((value == null) && (value2 != null)) {
      return value2;
    } else {
      return "";
    }
  }

  String factura2(value, value2) {
    if ((value == null) && (value2 == null)) {
      return '';
    } else if ((value != null) && (value2 == null)) {
      return value;
    } else if ((value == null) && (value2 != null)) {
      return value2;
    } else {
      return "";
    }
  }

  String factura3(value, value2) {
    if ((value == null) && (value2 == null)) {
      return '';
    } else if ((value != null) && (value2 == null)) {
      return value;
    } else if ((value == null) && (value2 != null)) {
      return value2;
    } else {
      return "";
    }
  }

  String factura4(value, value2) {
    if ((value == null) && (value2 == null)) {
      return '';
    } else if ((value != null) && (value2 == null)) {
      return value;
    } else if ((value == null) && (value2 != null)) {
      return value2;
    } else {
      return "";
    }
  }

  String factura5(value, value2) {
    if ((value == null) && (value2 == null)) {
      return '';
    } else if ((value != null) && (value2 == null)) {
      return value;
    } else if ((value == null) && (value2 != null)) {
      return value2;
    } else {
      return "";
    }
  }

  String commodity(value, value2) {
    if ((value == null) && (value2 == null)) {
      return '';
    } else if ((value != null) && (value2 == null)) {
      return value;
    } else if ((value == null) && (value2 != null)) {
      return value2;
    } else {
      return "";
    }
  }
}
