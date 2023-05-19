// ignore_for_file: prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter, file_names, prefer_if_null_operators, library_private_types_in_public_api, prefer_is_empty, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/globales.dart';
import 'CotizacionesScreen.dart';

class SeguimientoC extends StatefulWidget {
  const SeguimientoC({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<SeguimientoC> {
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
        'https://dynamicscf.azurewebsites.net/dynamics/listarCotizacionesS?name=$codigo'));
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
                              builder: (context) => CotizacionesScreen(
                                dataA![index]['quotenumber'].toString(),
                                dataA![index]['revisionnumber'].toString(),
                                dataA![index]['name'],
                                dataA![index]['new_pol'],
                                dataA![index]['new_poe'],
                                formatDOB(dataA![index]['effectivefrom']),
                                formatDOB(dataA![index]['effectiveto']),
                                dataA![index]['new_total'].toString(),
                                idtra(dataA![index]['_new_idtra1_value']
                                    .toString()),
                                dataA![index]['new_cantidadequipos'].toString(),
                                tamanio(dataA![index]['new_equipo']),
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
                              children: [
                                Text(
                                  dataA![index]['name'] != null
                                      ? dataA![index]['name']
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
