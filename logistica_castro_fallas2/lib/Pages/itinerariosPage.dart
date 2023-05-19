// ignore_for_file: file_names, library_private_types_in_public_api, avoid_unnecessary_containers

import 'dart:convert';

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:json_table/json_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'profilePage.dart';

class ItinerarioPage extends StatefulWidget {
  const ItinerarioPage({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<ItinerarioPage> {
  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  List<dynamic>? dataMC;
  List<dynamic>? dataQC;
  List<dynamic>? dataSC;
  List<dynamic>? dataNC;
  List<dynamic>? dataXnC;
  List<dynamic>? dataXgC;
  List<dynamic>? dataYC;
  List<dynamic>? dataCC;
  List<dynamic>? dataQP;
  List<dynamic>? dataSP;
  List<dynamic>? dataNP;
  List<dynamic>? dataXP;
  List<dynamic>? dataYP;
  List<JsonTableColumn>? columnsMC;
  List<JsonTableColumn>? columnsC;
  List<JsonTableColumn>? columnsZ;
  late Size size;

  SharedPreferences? prefs;
  String? code;

  cargar() async {
    prefs = await SharedPreferences.getInstance();
    code = prefs!.getString('code1');
  }

  Future fetchDataMC() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://logisticacastrofallas.com/_functions/miami_crc'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataMC = map["items"];
      });
    }
  }

  Future fetchDataQC() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://logisticacastrofallas.com/_functions/qingdao_crc'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataQC = map["items"];
      });
    }
  }

  Future fetchDataSC() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://logisticacastrofallas.com/_functions/shanghai_crc'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataSC = map["items"];
      });
    }
  }

  Future fetchDataNC() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://logisticacastrofallas.com/_functions/ningbo_crc'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataNC = map["items"];
      });
    }
  }

  Future fetchDataXnC() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://logisticacastrofallas.com/_functions/xiamen_crc'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataXnC = map["items"];
      });
    }
  }

  Future fetchDataXgC() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://logisticacastrofallas.com/_functions/xingang_crc'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataXgC = map["items"];
      });
    }
  }

  Future fetchDataYC() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://logisticacastrofallas.com/_functions/yantian_crc'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataYC = map["items"];
      });
    }
  }

  Future fetchDataCC() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://logisticacastrofallas.com/_functions/chongqing_crc'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataCC = map["items"];
      });
    }
  }

  Future fetchDataQP() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://logisticacastrofallas.com/_functions/qingdao_panama'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataQP = map["items"];
      });
    }
  }

  Future fetchDataSP() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://logisticacastrofallas.com/_functions/shanghai_panama'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataSP = map["items"];
      });
    }
  }

  Future fetchDataNP() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://logisticacastrofallas.com/_functions/ningbo_panama'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataNP = map["items"];
      });
    }
  }

  Future fetchDataXP() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://logisticacastrofallas.com/_functions/xiamen_panama'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataXP = map["items"];
      });
    }
  }

  Future fetchDataYP() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://logisticacastrofallas.com/_functions/yantian_panama'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        dataYP = map["items"];
      });
    }
  }

  @override
  void initState() {
    fetchDataMC();
    fetchDataQC();
    fetchDataSC();
    fetchDataNC();
    fetchDataXnC();
    fetchDataXgC();
    fetchDataYC();
    fetchDataCC();
    fetchDataQP();
    fetchDataSP();
    fetchDataNP();
    fetchDataXP();
    fetchDataYP();
    cargar();
    super.initState();
    columnsMC = [
      JsonTableColumn("semanas", label: "SEMANA #"),
      JsonTableColumn("cutOff", label: "CUT OFF"),
      JsonTableColumn("etd", label: "ETD"),
      JsonTableColumn("eta", label: "ETA"),
      JsonTableColumn("almacenFiscalSjo", label: "ALMACÉN FISCAL SJO"),
      JsonTableColumn("statusCarga", label: "STATUS DE SALIDA"),
      JsonTableColumn("_updatedDate",
          label: "FECHA DE ACTUALIZACIÓN", valueBuilder: formatDOB)
    ];
    columnsC = [
      JsonTableColumn("semanaNo", label: "SEMANA #"),
      JsonTableColumn("etd", label: "ETD", valueBuilder: formatDOB),
      JsonTableColumn("statusCarga", label: "STATUS DE ZARPE"),
      JsonTableColumn("destino", label: "DESTINO"),
      JsonTableColumn("_updatedDate",
          label: "FECHA DE ACTUALIZACIÓN", valueBuilder: formatDOB)
    ];
    columnsZ = [
      JsonTableColumn("semanaNo", label: "SEMANA #"),
      JsonTableColumn("etd", label: "ETD", valueBuilder: formatDOB),
      JsonTableColumn("statusZarpe", label: "STATUS DE ZARPE"),
      JsonTableColumn("destino", label: "DESTINO"),
      JsonTableColumn("_updatedDate",
          label: "FECHA DE ACTUALIZACION", valueBuilder: formatDOB)
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  String formatDOB(value) {
    var dateTime = DateFormat("yyyy-MM-dd").parse(value.toString());
    return DateFormat("d MMM yyyy").format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
                  if (prefs!.getBool('user1') != false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PerfilPage()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login3()),
                    );
                  }
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
        body: Stack(
          children: [
            Container(
              child: CustomPaint(
                painter: ShapesPainter(),
                child: Container(
                  height: size.height / 2,
                ),
              ),
            ),
            Accordion(
              maxOpenSections: 2,
              headerBackgroundColorOpened: Colors.black54,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  header: Text('MIAMI TO CRC', style: _headerStyle),
                  content: dataMC != null
                      ? JsonTable(
                          columns: columnsMC,
                          dataMC!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('QINGDAO, CHINA TO CRC', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataQC != null
                      ? JsonTable(
                          columns: columnsC,
                          dataQC!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('SHANGHÁI, CHINA TO CRC', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataSC != null
                      ? JsonTable(
                          columns: columnsZ,
                          dataSC!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('NINGBO, CHINA TO CRC', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataNC != null
                      ? JsonTable(
                          columns: columnsZ,
                          dataNC!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('XIAMEN, CHINA TO CRC', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataXnC != null
                      ? JsonTable(
                          columns: columnsZ,
                          dataXnC!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('XINGANG, CHINA TO CRC', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataXgC != null
                      ? JsonTable(
                          columns: columnsZ,
                          dataXgC!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('YANTIAN, CHINA TO CRC', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataYC != null
                      ? JsonTable(
                          columns: columnsZ,
                          dataYC!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('CHONGQING, CHINA TO CRC', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataCC != null
                      ? JsonTable(
                          columns: columnsC,
                          dataCC!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('QINGDAO, CHINA TO PANAMÁ', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataQP != null
                      ? JsonTable(
                          columns: columnsC,
                          dataQP!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header:
                      Text('SHANGHÁI, CHINA TO PANAMÁ', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataSP != null
                      ? JsonTable(
                          columns: columnsC,
                          dataSP!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('NINGBO, CHINA TO PANAMÁ', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataNP != null
                      ? JsonTable(
                          columns: columnsC,
                          dataNP!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('XIAMEN, CHINA TO PANAMÁ', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataXP != null
                      ? JsonTable(
                          columns: columnsC,
                          dataXP!,
                        )
                      : const CircularProgressIndicator(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white),
                  header: Text('YANTIAN, CHINA TO PANAMÁ', style: _headerStyle),
                  headerBackgroundColor: Colors.black,
                  headerBackgroundColorOpened: Colors.red,
                  content: dataYP != null
                      ? JsonTable(
                          columns: columnsC,
                          dataYP!,
                        )
                      : const CircularProgressIndicator(),
                ),
              ],
            ),
          ],
        ));
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the paint color to be white
    paint.color = Colors.white;
    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    paint.color = Colors.grey; //const Color.fromARGB(255, 08, 22, 162);
    // create a path
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    // close the path to form a bounded shape
    path.close();
    canvas.drawPath(path, paint);
    /* // set the color property of the paint
    paint.color = Colors.deepOrange;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);
    // draw the circle with center having radius 75.0
    canvas.drawCircle(center, 75.0, paint);*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
