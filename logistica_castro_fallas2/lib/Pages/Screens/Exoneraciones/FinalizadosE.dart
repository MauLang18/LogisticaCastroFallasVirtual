// ignore_for_file: prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter, file_names, prefer_if_null_operators, library_private_types_in_public_api, prefer_is_empty, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/globales.dart';
import 'ExoneracionesScreen.dart';

class FinalizadosE extends StatefulWidget {
  const FinalizadosE({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FinalizadosE> {
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
        'https://dynamicscf.azurewebsites.net/dynamics/listarExoneracionesF?name=$codigo'));
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
                              builder: (context) => ExoneracionesScreen(
                                dataA![index]['name'],
                                tipo(dataA![index]['new_tipoexoneracin']),
                                idtra(dataA![index]
                                        ['_new_idtravinculadocorrecto_value']
                                    .toString()),
                                dataA![index]['new_solicitud'],
                                dataA![index]['new_autorizacin'],
                                formatDOB(dataA![index]['new_validahasta']),
                                exoneracion(
                                    dataA![index]['new_statusexoneracion']),
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataA![index]['name'],
                              style: TextStyle(color: Colors.white),
                            ),
                            Column(
                              children: [
                                Text(
                                  dataA![index]['new_solicitud'] != null
                                      ? dataA![index]['new_solicitud']
                                      : " ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                                Text(
                                  dataA![index]['new_autorizacin'] != null
                                      ? dataA![index]['new_autorizacin']
                                      : " ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                              ],
                            ),
                            Text(
                              exoneracion(
                                  dataA![index]['new_statusexoneracion']),
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

  String exoneracion(value) {
    switch (value) {
      case 100000000:
        return 'Solicitante';
      case 100000001:
        return 'Ente Recomendador';
      case 100000002:
        return 'Analista';
      case 100000003:
        return 'Coordinador';
      case 100000004:
        return 'Autorizada';
      default:
        return '';
    }
  }

  String tipo(value) {
    switch (value) {
      case 100000000:
        return 'Generica';
      case 100000001:
        return 'Concreta';
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
}
