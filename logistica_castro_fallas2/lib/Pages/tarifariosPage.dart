// ignore_for_file: sized_box_for_whitespace, file_names, library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Mail/mailServices.dart';
import 'login.dart';
import 'profilePage.dart';

class TarifarioPage extends StatefulWidget {
  const TarifarioPage({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<TarifarioPage> {
  String fName = '';
  String lName = '';
  String uName = '';
  String email = '';
  String mobile = '';
  String detalles = '';

  bool box1 = false;
  bool box2 = false;
  bool box3 = false;
  bool box4 = false;
  bool box5 = false;
  bool box6 = false;

  List<String> termino = [
    "AW +297",
    "AO +244",
    "AF +93",
    "AI +1",
    "AX +358",
    "AL +355",
    "AD +376",
    "AE +971",
    "AR +54",
    "AM +374",
    "AS +1684",
    "AQ +672",
    "TF +262",
    "AG +1",
    "AU +61",
    "AT +43",
    "AZ +994",
    "BI +257",
    "BE +32",
    "BJ +229",
    "BQ +599",
    "BF +226",
    "BD +880",
    "BG +359",
    "BH +973",
    "BS +1",
    "BA +387",
    "BL +590",
    "BY +375",
    "BZ +501",
    "BM +1",
    "BO +591",
    "BR +55",
    "BB +1246",
    "BN +673",
    "BT +975",
    "BV +55",
    "BW +267",
    "CF +236",
    "CA +1",
    "CC +61",
    "CH +41",
    "CL +56",
    "CN +86",
    "CI +225",
    "CM +237",
    "CD +243",
    "CG +242",
    "CK +682",
    "CO +57",
    "KM +269",
    "CV +238",
    "CR +506",
    "CW +599",
    "CX +61",
    "KY +1",
    "CY +357",
    "CZ +420",
    "DE +49",
    "DJ +253",
    "DM +1",
    "DK +45",
    "DO +1",
    "DZ +213",
    "EC +593",
    "EG +20",
    "ER +291",
    "EH +212",
    "ES +34",
    "EE +372",
    "ET +251",
    "FI +358",
    "FJ +679",
    "FK +500",
    "FR +33",
    "FO +298",
    "FM +691",
    "GA +241",
    "GB +44",
    "GE +995",
    "GG +44",
    "GH +233",
    "GI +350",
    "GN +224",
    "GP +590",
    "GM +220",
    "GW +245",
    "GQ +240",
    "GR +30",
    "GD +1",
    "GL +299",
    "GT +502",
    "GF +594",
    "GU +1",
    "GY +592",
    "HK +852",
    "HM +672",
    "HN +504",
    "HR +385",
    "HT +509",
    "HU +36",
    "ID +62",
    "IM +44",
    "IN +91",
    "IO +246",
    "IE +353",
    "IS +354",
    "IL +972",
    "IT +39",
    "JM +1876",
    "JE +44",
    "JO +962",
    "JP +81",
    "KZ +254",
    "KG +996",
    "KH +885",
    "KI +686",
    "KN +1",
    "KR +82",
    "XK +383",
    "KW +965",
    "LA +856",
    "LB +961",
    "LR +231",
    "LY +218",
    "LC +1",
    "LI +423",
    "LK +94",
    "LS +266",
    "LT +370",
    "LU +352",
    "LV +371",
    "MO +853",
    "MF +590",
    "MA +212",
    "MC +377",
    "MD +373",
    "MG +261",
    "MV +960",
    "MX +52",
    "MH +692",
    "MK +389",
    "ML +223",
    "MT +356",
    "MM +95",
    "ME +382",
    "MN +976",
    "MP +1670",
    "MZ +258",
    "MR +222",
    "MS +1",
    "MQ +596",
    "MU +230",
    "MW +265",
    "MY +60",
    "YT +262",
    "NA +264",
    "NC +687",
    "NE +227",
    "NF +672",
    "NG +234",
    "NI +505",
    "NU +683",
    "NL +31",
    "NO +47",
    "NP +977",
    "NR +674",
    "NZ +64",
    "OM +968",
    "PK +92",
    "PA +507",
    "PN +64",
    "PE +51",
    "PH +63",
    "PW +680",
    "PG +675",
    "PL +48",
    "PR +1",
    "PT +351",
    "PY +595",
    "PS +970",
    "PF +689",
    "QA +974",
    "RE +262",
    "RO +40",
    "RU +40",
    "RU +7",
    "RW +250",
    "SA +966",
    "SD +249",
    "SN +221",
    "SG +65",
    "GS +500",
    "SH +290",
    "SJ +47",
    "SB +677",
    "SL +232",
    "SV +503",
    "SM + 378",
    "SO +252",
    "PM +508",
    "RS +381",
    "SS +211",
    "ST +239",
    "SR +597",
    "SK +421",
    "SI +386",
    "SE +46",
    "SZ +268",
    "SX +1721",
    "SC +248",
    "TC +1",
    "TD +335",
    "TG +228",
    "TH +66",
    "TJ +992",
    "TK +690",
    "TM +993",
    "TL +670",
    "TO +676",
    "TT +1868",
    "TN +216",
    "TR +90",
    "TV +688",
    "TW +886",
    "TZ +255",
    "UG +256",
    "UA +380",
    "UM +1",
    "UY +598",
    "US +1",
    "UZ +998",
    "VA +39",
    "VC +1",
    "VE +58",
    "VG +1",
    "VI +1",
    "VN +84",
    "VU +681",
    "WS +685",
    "YE +967",
    "ZA +27",
    "ZM +260",
    "ZM +263"
  ];

  List<String> servicio = [
    "LCL Miami to San José, CRC",
    "FCL Chongqin to San José, CRC",
    "FCL Dalian to Callao, Perú",
    "FCL Fuzhou to Callao, Perú",
    "FCL Ho Chi Minh to San José, CRC",
    "FCL Ningbo to San José, CRC",
    "FCL Ningbo to Zona Libre, Colón, Panamá",
    "FCL Ningbo to Pto.Quetzal, Gte",
    "FCL Qingdao to San José, CRC",
    "FCL Qingdao to Callao, Perú",
    "FCL Qingdao to Pto.Quetzal, Gte",
    "FCL Qingdao to Zona Libre, Colón, Panamá",
    "FCL Shanghái to San José, CRC",
    "FCL Shanghái to Pto.Quetzal, Gte",
    "FCL Shanghái to Zona Libre, Colón, Panamá",
    "FCL Xiamen to San José, CRC",
    "FCL Xiamen to Pto.Quetzal, Gte",
    "FCL Xiamen to Zona Libre, Colón, Panamá",
    "FCL Xingang to San José, CRC",
    "FCL Yantian to San José, CRC",
    "FCL Yantian to Zona Libre, Colón, Panamá",
    "FCL Yantian to Pto.Quetzal, Gte"
  ];

  String? _termino;
  String? _servicio;

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController uNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController descController = TextEditingController();

  late Size size;

  SharedPreferences? prefs;
  String? code;

  cargar() async {
    prefs = await SharedPreferences.getInstance();
    code = prefs!.getString('code1');
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
                  physics: const BouncingScrollPhysics(),
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
                                "SOLICITUD TARIFARIOS",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: fNameController,
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  hintText: 'Ingrese su nombre',
                                  label: const Text(
                                    'Nombre',
                                    style: TextStyle(
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
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: TextField(
                                controller: lNameController,
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  hintText: 'Ingrese su apellido',
                                  label: const Text(
                                    'Apellido',
                                    style: TextStyle(
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
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller: uNameController,
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            hintText: 'Ingrese el nombre de su empresa',
                            label: const Text(
                              'Empresa',
                              style: TextStyle(
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
                          ),
                        ),
                        const SizedBox(height: 20.0),
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
                            hintText: 'Ingrese su email',
                            // errorText: error,
                            label: const Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 3),
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: DropdownButtonFormField(
                                      value: _termino,
                                      onChanged: (value) {
                                        setState(() {
                                          _termino = value;
                                        });
                                      },
                                      items: termino
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      decoration: const InputDecoration(
                                        hintText: "Elige una opción",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: TextFormField(
                                controller: mobileController,
                                style: const TextStyle(fontSize: 15),
                                keyboardType: TextInputType.phone,
                                onChanged: (val) {
                                  key.currentState!.validate();
                                },
                                decoration: InputDecoration(
                                  hintText: 'Ingrese su número de teléfono',
                                  label: const Text(
                                    'Teléfono',
                                    style: TextStyle(
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
                                  prefixIcon: const Icon(
                                    Icons.phone_android,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Selecciona un servicio:',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: descController,
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
                        const SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            color: Colors.black,
                            onPressed: () {
                              key.currentState!.validate();
                              setState(() {
                                fName = fNameController.text;
                                lName = lNameController.text;
                                uName = uNameController.text;
                                email = emailController.text;
                                mobile = mobileController.text;
                                detalles = descController.text;
                              });
                              if (key.currentState!.validate()) {
                                String termino = _termino!;
                                String servicio = _servicio!;

                                sendEmailTI(
                                    nombre: fNameController.text,
                                    apellido: lNameController.text,
                                    empresa: uNameController.text,
                                    code: termino,
                                    telefono: mobileController.text,
                                    servicio: servicio,
                                    email: emailController.text,
                                    subject: 'SOLICITUD DE TARIFARIO',
                                    detalles: descController.text);

                                sendEmailTC(
                                    nombre: fNameController.text,
                                    servicio: servicio,
                                    email: emailController.text,
                                    subject: "SOLICITUD DE TARIFARIO",
                                    detalles: descController.text);
                              }
                            },
                            elevation: 20.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: const Text(
                              'SOLICITAR TARIFA',
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
