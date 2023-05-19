// ignore_for_file: prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter, file_names, prefer_if_null_operators, library_private_types_in_public_api, prefer_is_empty, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/globales.dart';
import 'CertificadosScreen.dart';

class FinalizadosC extends StatefulWidget {
  const FinalizadosC({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FinalizadosC> {
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
        'https://dynamicscf.azurewebsites.net/dynamics/listarCertificadosF?name=$codigo'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataA = map["value"];
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
                              builder: (context) => CertificadosScreen(
                                dataA![index]
                                    ['new_decertificadodereexportacion'],
                                dataA![index]['new_factura'],
                                certificado(
                                    dataA![index]['new_statusdecertificado']),
                                dataA![index]['title'],
                                dataA![index]['new_bcf'],
                                dataA![index][
                                    'new_observacionescertificadosreexportacion'],
                                preestado(dataA![index]['new_preestado2']),
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataA![index][
                                          'new_decertificadodereexportacion'] !=
                                      null
                                  ? dataA![index]
                                      ['new_decertificadodereexportacion']
                                  : " ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Column(
                              children: [
                                Text(
                                  dataA![index]['new_factura'] != null
                                      ? dataA![index]['new_factura']
                                      : " ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                              ],
                            ),
                            Text(
                              certificado(
                                  dataA![index]['new_statusdecertificado']),
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

  String certificado(value) {
    switch (value) {
      case 100000000:
        return 'Pendiente de Solicitar';
      case 100000001:
        return 'Pendiente de Aprobación en SIGA';
      case 100000002:
        return 'En Tramite Boleta Banco';
      case 100000003:
        return 'Aprobado en SIGA';
      case 100000004:
        return 'En Firmas ZOLICOL';
      case 100000005:
        return 'En Firmas Aduana';
      case 100000006:
        return 'Aprobado y Listo - HUB Panamá';
      case 100000007:
        return 'Scanner Enviado';
      case 100000008:
        return 'Original Entregado y Finalizado';
      default:
        return '';
    }
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
