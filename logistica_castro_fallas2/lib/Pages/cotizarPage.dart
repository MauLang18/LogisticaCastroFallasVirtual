// ignore_for_file: file_names, library_private_types_in_public_api, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Mail/mailServices.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Screens/TarifasMercadoPage.dart';
import 'login.dart';
import 'profilePage.dart';

class CotizarPage extends StatefulWidget {
  const CotizarPage({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<CotizarPage> {
  String fName = '';
  String valor = '';
  String volumen = '';
  String peso = '';
  String dimenciones = '';
  String observacion = '';
  String email = '';
  String mobile = '';
  String numero = '';

  bool box1 = false;
  bool box2 = false;
  bool box3 = false;
  bool box4 = false;
  bool box5 = false;
  bool box6 = false;

  List<String> termino = [
    "EXW",
    "FOB",
    "DDP",
    "CIF",
    "CFR",
    "DAP",
    "FCA",
  ];

  List<String> servicio = [
    "Marítimo LCL",
    "Marítimo FCL 1X40STD/HC",
    "Marítimo FCL 1X20STD",
    "Aéreo",
    "Carga Proyecto",
    "Terrestre LTL",
    "Terrestre FTL 1X53/48",
    "Terrestre FTL 1X20"
  ];

  List<String> origen = [
    "Miami, USA (SD)",
    "Port Everglades, USA (CY)",
    "Qingdao, CN (CY)",
    "Shanghái, CN (CY)",
    "Ningbo, CN (CY)",
    "Yantian, CN (CY)",
    "Xingang, CN (CY)",
    "Xiamen, CN (CY)",
    "Chongqing, China",
    "Ho Chi Minh, Vietnam",
    "Mundra, India",
    "San José, Costa Rica"
  ];

  List<String> destino = [
    "Puerto Caldera, CRC (CY)",
    "Puerto Moin, CRC (CY)",
    "San José, CRC (SD)",
    "Puerto Quetzal, Guatemala",
    "Puerto Callao, Perú",
    "Zona Libre, Colón, Panamá"
  ];

  List<String> producto = [
    "Carga General",
    "Carga Peligrosa",
    "Alimentos",
    "Menaje Casa",
  ];

  String? _termino;
  String? _servicio;
  String? _origen;
  String? _destino;
  String? _producto;

  TextEditingController fNameController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController volumenController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController dimenController = TextEditingController();
  TextEditingController obserController = TextEditingController();
  TextEditingController uNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  late Size size;

  SharedPreferences? prefs;
  bool code = false;

  cargar() async {
    prefs = await SharedPreferences.getInstance();
    code = prefs!.getBool('user1')!;
  }

  @override
  void initState() {
    cargar();
    super.initState();
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();
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
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                              width: 1000,
                              height: 100,
                              child: const Text(
                                "COMIENZA TU OPERACIÓN",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        _buttom(),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: numeroController,
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  hintText: 'Ingrese número de tarifa',
                                  label: const Text(
                                    'Número de Tarifa',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 3,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 3,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: fNameController,
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  hintText: 'Ingrese el nombre de la empresa',
                                  label: const Text(
                                    'Nombre Empresa',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 3,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 3,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(fontSize: 15),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) {
                            key.currentState!.validate();
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            hintText: 'Ingresa el correo electrónico',
                            label: const Text(
                              'Correo Electrónico',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 3),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                )),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: mobileController,
                          style: const TextStyle(fontSize: 15),
                          keyboardType: TextInputType.phone,
                          onChanged: (val) {
                            key.currentState!.validate();
                          },
                          decoration: InputDecoration(
                            hintText: 'Ingrese el número telefónico',
                            label: const Text(
                              'Número Telefónico',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                )),
                            prefixIcon: const Icon(
                              Icons.phone_android,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tipo de Operación:',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.red,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: box1,
                                        onChanged: (val) {
                                          setState(() {
                                            box1 = val!;
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            box1 = !box1;
                                          });
                                        },
                                        child: const Text('Importación'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: box2,
                                        onChanged: (val) {
                                          setState(() {
                                            box2 = val!;
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            box2 = !box2;
                                          });
                                        },
                                        child: const Text('Exportación'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Termino Negociación:',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                              ),
                            ),
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
                                },
                                items: termino.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  hintText: "Elige una opción",
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Servicio:',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 40),
                                color: Colors.white,
                              ),
                              child: DropdownButtonFormField(
                                value: _servicio,
                                onChanged: (value) {
                                  setState(() {
                                    _servicio = value;
                                  });
                                },
                                items: servicio.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  hintText: "Elige una opción",
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Origen:',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 40),
                                color: Colors.white,
                              ),
                              child: DropdownButtonFormField(
                                value: _origen,
                                onChanged: (value) {
                                  setState(() {
                                    _origen = value;
                                  });
                                },
                                items: origen.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  hintText: "Elige una opción",
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Destino:',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 40),
                                color: Colors.white,
                              ),
                              child: DropdownButtonFormField(
                                value: _destino,
                                onChanged: (value) {
                                  setState(() {
                                    _destino = value;
                                  });
                                },
                                items: destino.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  hintText: "Elige una opción",
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tipo Producto:',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 40),
                                color: Colors.white,
                              ),
                              child: DropdownButtonFormField(
                                value: _producto,
                                onChanged: (value) {
                                  setState(() {
                                    _producto = value;
                                  });
                                },
                                items: producto.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  hintText: "Elige una opción",
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: valorController,
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintText: 'Ingrese el valor de la mercancía',
                            label: const Text(
                              'Valor de la Mercancía',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                )),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Servicios Integrales:',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.red,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: box3,
                                        onChanged: (val) {
                                          setState(() {
                                            box3 = val!;
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            box3 = !box3;
                                          });
                                        },
                                        child: const Text('Seguro Carga'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: box4,
                                        onChanged: (val) {
                                          setState(() {
                                            box4 = val!;
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            box4 = !box4;
                                          });
                                        },
                                        child:
                                            const Text('Transporte Nacional'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: box5,
                                        onChanged: (val) {
                                          setState(() {
                                            box5 = val!;
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            box5 = !box5;
                                          });
                                        },
                                        child: const Text('Agencia Aduanas'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: box6,
                                        onChanged: (val) {
                                          setState(() {
                                            box6 = val!;
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            box6 = !box6;
                                          });
                                        },
                                        child: const Text('Almacén Fiscal'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: pesoController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintText: 'Ingrese el peso de la mercancía',
                            label: const Text(
                              'Peso',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                )),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: volumenController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintText: 'Ingrese el volumen de la mercancía',
                            label: const Text(
                              'Volumen',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                )),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            color: Colors.black,
                            onPressed: () {
                              key.currentState!.validate();
                              setState(() {
                                var url =
                                    "https://www.ginifab.com/feeds/cbm/index.es.html";
                                // ignore: deprecated_member_use
                                launch(url);
                              });
                            },
                            elevation: 20.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: const Text(
                              'CBM/CFT',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        TextField(
                          controller: dimenController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintText: 'Ingrese las dimensiones',
                            label: const Text(
                              'Dimensiones',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                )),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: obserController,
                          keyboardType: TextInputType.multiline,
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintText: 'Agregar respuesta aquí',
                            label: const Text(
                              'Comentarios u Observaciones',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                )),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            color: Colors.black,
                            onPressed: () {
                              key.currentState!.validate();
                              setState(() {
                                fName = fNameController.text;
                                valor = valorController.text;
                                peso = pesoController.text;
                                volumen = volumenController.text;
                                dimenciones = dimenController.text;
                                observacion = obserController.text;
                                email = emailController.text;
                                mobile = mobileController.text;
                                numero = numeroController.text;
                              });
                              if (key.currentState!.validate()) {
                                var importacion = "";
                                var exportacion = "";
                                var seguro = "";
                                var transporte = "";
                                var aduanas = "";
                                var almacen = "";

                                if (box1) {
                                  importacion = "Importación";
                                }
                                if (box2) {
                                  exportacion = "Exportación";
                                }
                                if (box3) {
                                  seguro = "Seguro Carga";
                                }
                                if (box4) {
                                  transporte = "Transporte Nacional";
                                }
                                if (box5) {
                                  aduanas = "Agencia Aduanal";
                                }
                                if (box6) {
                                  almacen = "Almacén Fiscal";
                                }

                                String servicio = _servicio!;
                                String termino = _termino!;
                                String destino = _destino!;
                                String origen = _origen!;
                                String producto = _producto!;

                                sendEmailCI(
                                    numero: numero,
                                    empresa: fName,
                                    email: email,
                                    telefono: mobile,
                                    importacion: importacion,
                                    exportacion: exportacion,
                                    termino: termino,
                                    servicio: servicio,
                                    origen: origen,
                                    destino: destino,
                                    producto: producto,
                                    valor: valor,
                                    peso: peso,
                                    volumen: volumen,
                                    seguro: seguro,
                                    trnasporte: transporte,
                                    aduanas: aduanas,
                                    almacen: almacen,
                                    dimensiones: dimenciones,
                                    observaciones: observacion,
                                    subject: "COTIZACIÓN");

                                sendEmailCC(
                                    numero: numero,
                                    empresa: fName,
                                    email: email,
                                    telefono: mobile,
                                    importacion: importacion,
                                    exportacion: exportacion,
                                    termino: termino,
                                    servicio: servicio,
                                    origen: origen,
                                    destino: destino,
                                    producto: producto,
                                    valor: valor,
                                    peso: peso,
                                    volumen: volumen,
                                    seguro: seguro,
                                    trnasporte: transporte,
                                    aduanas: aduanas,
                                    almacen: almacen,
                                    dimensiones: dimenciones,
                                    observaciones: observacion,
                                    subject: "COTIZACIÓN");
                              }
                            },
                            elevation: 20.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: const Text(
                              'COTIZAR',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buttom() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: () => {_login()},
        child: Text(
          "TARIFAS DE MERCADO",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (prefs?.getBool('user1') != false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TarifasMercadoPage()),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Necesitas tener cuenta para acceder",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login3()),
      );
    }
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
