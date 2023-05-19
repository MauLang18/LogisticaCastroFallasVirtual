// ignore_for_file: prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter, file_names, prefer_if_null_operators, library_private_types_in_public_api, prefer_is_empty, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:logistica_castro_fallas2/Pages/Screens/MiamiPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/globales.dart';
import 'MiamiScreen.dart';

class PreAlertaMiami extends StatefulWidget {
  const PreAlertaMiami({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<PreAlertaMiami> {
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
        'https://dynamicscf.azurewebsites.net/dynamics/WHSMiamiPreAlerta?name=$codigo'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataA = map["value"];
      });
    }
  }

  Future fetchShipper(String code1) async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://dynamicscf.azurewebsites.net/dynamics/listarClienteNombre?name=$code1'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataS = map["value"];

        if (dataS!.length == 0) {
          ship = "";
        } else {
          if (dataS![0]['name'] != null) {
            ship = dataS![0]['name'];
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
                              builder: (context) => MiamiScreen(
                                dataA![index]['title'],
                                dataA![index]['new_warehousetrackingident'],
                                bodega(dataA![index]['new_habilitarbodega']),
                                preestado(dataA![index]['new_preestado2']),
                                dataA![index]['new_obersvaciones'],
                                dataA![index]['new_factura'],
                                dataA![index]['new_po'],
                                shipper(dataA![index]['_new_shipper_value']
                                    .toString()),
                                dataA![index]['new_bcf'],
                                formatDOB(
                                    dataA![index]['new_fechaingresobodegawhs']),
                                dataA![index]['new_contidadbultos'].toString(),
                                tipo(dataA![index]['new_tipoembalaje']),
                                dataA![index]['new_contenedor'],
                                dataA![index]['new_statuscliente'],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataA![index]['title'] != null
                                  ? dataA![index]['title']
                                  : " ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Column(
                              children: [
                                Text(
                                  dataA![index]['new_warehousetrackingident'] !=
                                          null
                                      ? dataA![index]
                                          ['new_warehousetrackingident']
                                      : " ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            Text(
                              dataA![index]['new_contenedor'] != null
                                  ? dataA![index]['new_contenedor']
                                  : " ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              preestado(dataA![index]['new_preestado2']),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 12),
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
      case 100000008:
        return 'Facturación';
      case 100000014:
        return 'Pre-Alerta';
      case 100000023:
        return 'Archivado Gerencia';
      case 100000022:
        return 'Archivado CAJA';
      case 100000021:
        return 'Cancelado';
      case 100000020:
        return 'Comisión Pendiente';
      case 100000019:
        return 'Disputa';
      case 100000012:
        return 'Tramite Vinculado';
      case 100000000:
        return 'Coordinación Origen';
      case 100000013:
        return 'Coordinación Origen Miami';
      case 100000015:
        return 'Carga Bodega Miami';
      case 100000016:
        return 'Esperando Factura';
      case 100000001:
        return 'Booking Listo';
      case 100000017:
        return 'Preparando Envio';
      case 100000002:
        return 'En Transito';
      case 100000003:
        return 'Carga en Pto. Entrada';
      case 100000004:
        return 'Carga en Almacen DESTINO';
      case 100000005:
        return 'Tramite Aduanas';
      case 100000006:
        return 'Pago Pendiente';
      case 100000018:
        return 'Ruta Entrega';
      case 100000007:
        return 'Colocación CRC';
      case 100000009:
        return 'Pre-Revisión';
      case 100000010:
        return 'Archivado';
      case 100000011:
        return 'Finalizado';
      case 100000024:
        return 'Movimiento Panamá to CRC';
      case 100000025:
        return 'Carga Bodega CFS Panamá';
      case 100000026:
        return 'Carga en Bodega HUB Panamá';
      default:
        return '';
    }
  }

  String tipo(value) {
    switch (value) {
      case 100000000:
        return 'PCS';
      case 100000001:
        return 'BAGS';
      case 100000002:
        return 'PTL';
      case 100000003:
        return 'CTNS';
      case 100000004:
        return 'PKG';
      case 100000005:
        return 'ROLLOS';
      default:
        return '';
    }
  }

  String bodega(value) {
    switch (value) {
      case 100000000:
        return 'WHS Miami';
      case 100000001:
        return 'WHS Costa Rica';
      case 100000002:
        return 'WHS Panamá';
      case 100000003:
        return 'NO APLICA';
      default:
        return '';
    }
  }

  String shipper(value) {
    if (value != null || value != "null") {
      fetchShipper(value);
      return ship;
    } else {
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
}
