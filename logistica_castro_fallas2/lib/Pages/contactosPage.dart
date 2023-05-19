// ignore_for_file: file_names, library_private_types_in_public_api, sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Mail/emailServices.dart';
import '../Phone/whatsappServices.dart';
import '../Phone/phoneServices.dart';
import 'login.dart';
import 'profilePage.dart';

class ContactosPage extends StatefulWidget {
  const ContactosPage({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<ContactosPage> {
  final Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];
  SharedPreferences? prefs;
  String? code;

  cargar() async {
    prefs = await SharedPreferences.getInstance();
    code = prefs!.getString('code1');
  }

  @override
  void initState() {
    initilize();
    cargar();
    super.initState();
  }

  initilize() {
    Marker costaRica = Marker(
        markerId: const MarkerId('costarica'),
        position: const LatLng(9.915085533193173, -84.0457210670351),
        infoWindow: const InfoWindow(title: 'Oficina Central'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker nicaragua = Marker(
        markerId: const MarkerId('nicaragua'),
        position: const LatLng(13.46912079583891, -85.2733906614443),
        infoWindow: const InfoWindow(title: 'Oficina Nicaragua'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker usa = Marker(
        markerId: const MarkerId('usa'),
        position: const LatLng(39.54230836449892, -101.84087340935952),
        infoWindow: const InfoWindow(title: ' Oficina USA'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker peru = Marker(
        markerId: const MarkerId('peru'),
        position: const LatLng(-10.94794924607444, -74.74247102841893),
        infoWindow: const InfoWindow(title: 'Oficina Perú'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker china = Marker(
        markerId: const MarkerId('china'),
        position: const LatLng(34.70672549614855, 103.11684637190575),
        infoWindow: const InfoWindow(title: 'Oficina China'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker brasil = Marker(
        markerId: const MarkerId('brasil'),
        position: const LatLng(-8.482441641225016, -56.40636426171537),
        infoWindow: const InfoWindow(title: 'Oficina Brasil'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker mexico = Marker(
        markerId: const MarkerId('mexico'),
        position: const LatLng(24.178908261467836, -103.46999241292284),
        infoWindow: const InfoWindow(title: 'Oficina México'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker guatemala = Marker(
        markerId: const MarkerId('guatemala'),
        position: const LatLng(15.737811820859697, -90.38080905497554),
        infoWindow: const InfoWindow(title: 'Oficina Guatemala'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker panama = Marker(
        markerId: const MarkerId('panama'),
        position: const LatLng(8.566968471927227, -80.11959503022514),
        infoWindow: const InfoWindow(title: 'Oficina Panamá'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker japon = Marker(
        markerId: const MarkerId('japon'),
        position: const LatLng(36.66815866487394, 138.3889060978813),
        infoWindow: const InfoWindow(title: 'Oficina Japón'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker salvador = Marker(
        markerId: const MarkerId('salvador'),
        position: const LatLng(13.697650453973681, -89.21880515911914),
        infoWindow: const InfoWindow(title: 'Oficina El Salvador'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker india = Marker(
        markerId: const MarkerId('india'),
        position: const LatLng(22.912290355139113, 78.99855934480858),
        infoWindow: const InfoWindow(title: 'Oficina India'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker alemania = Marker(
        markerId: const MarkerId('alemania'),
        position: const LatLng(51.131320813684, 10.23112667820357),
        infoWindow: const InfoWindow(title: 'Oficina Alemania'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker colombia = Marker(
        markerId: const MarkerId('colombia'),
        position: const LatLng(3.4708146336733594, -73.78032484349183),
        infoWindow: const InfoWindow(title: 'Oficina Colombia'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker espana = Marker(
        markerId: const MarkerId('españa'),
        position: const LatLng(39.598872488934305, -3.6322701236618204),
        infoWindow: const InfoWindow(title: 'Oficina España'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker holanda = Marker(
        markerId: const MarkerId('holanda'),
        position: const LatLng(52.19173769305382, 5.706617182549954),
        infoWindow: const InfoWindow(title: 'Oficina Holanda'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker honduras = Marker(
        markerId: const MarkerId('honduras'),
        position: const LatLng(14.894902281974526, -87.00326180265341),
        infoWindow: const InfoWindow(title: 'Oficina Honduras'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker francia = Marker(
        markerId: const MarkerId('francia'),
        position: const LatLng(46.52166759807105, 2.235425022150667),
        infoWindow: const InfoWindow(title: 'Oficina Francia'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker indonesia = Marker(
        markerId: const MarkerId('indonesia'),
        position: const LatLng(-4.513414852872824, 121.88931514717682),
        infoWindow: const InfoWindow(title: 'Oficina Indonesia'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker taiwan = Marker(
        markerId: const MarkerId('taiwan'),
        position: const LatLng(23.459617189947128, 121.25712937200021),
        infoWindow: const InfoWindow(title: 'Oficina Taiwán'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker thailandia = Marker(
        markerId: const MarkerId('thailandia'),
        position: const LatLng(15.385970263351584, 100.66310951135716),
        infoWindow: const InfoWindow(title: 'Oficina Thailandia'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker sudafrica = Marker(
        markerId: const MarkerId('sudafrica'),
        position: const LatLng(-30.85430592586592, 24.1864349179294),
        infoWindow: const InfoWindow(title: 'Oficina Sudáfrica'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker paraguay = Marker(
        markerId: const MarkerId('paraguay'),
        position: const LatLng(-23.221502177920815, -58.4618386170718),
        infoWindow: const InfoWindow(title: 'Oficina Paraguay'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker argentina = Marker(
        markerId: const MarkerId('argentina'),
        position: const LatLng(-35.140772366879006, -66.0523202719648),
        infoWindow: const InfoWindow(title: 'Oficina Argentina'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker chile = Marker(
        markerId: const MarkerId('chile'),
        position: const LatLng(-26.49448009031793, -70.18319905977701),
        infoWindow: const InfoWindow(title: 'Oficina Chile'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker canada = Marker(
        markerId: const MarkerId('canada'),
        position: const LatLng(60.489970878222174, -110.59295118967651),
        infoWindow: const InfoWindow(title: 'Oficina Canadá'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker italia = Marker(
        markerId: const MarkerId('italia'),
        position: const LatLng(43.09309490736015, 12.529588815253362),
        infoWindow: const InfoWindow(title: 'Oficina Italia'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker ecuador = Marker(
        markerId: const MarkerId('ecuador'),
        position: const LatLng(-1.465947166784015, -78.28522334019827),
        infoWindow: const InfoWindow(title: 'Oficina Ecuador'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker korea = Marker(
        markerId: const MarkerId('korea'),
        position: const LatLng(36.34371354642492, 127.89090733239382),
        infoWindow: const InfoWindow(title: 'Oficina Korea'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));

    markers.add(costaRica);
    markers.add(peru);
    markers.add(china);
    markers.add(brasil);
    markers.add(mexico);
    markers.add(usa);
    markers.add(guatemala);
    markers.add(panama);
    markers.add(japon);
    markers.add(salvador);
    markers.add(india);
    markers.add(alemania);
    markers.add(colombia);
    markers.add(espana);
    markers.add(holanda);
    markers.add(nicaragua);
    markers.add(honduras);
    markers.add(francia);
    markers.add(indonesia);
    markers.add(taiwan);
    markers.add(thailandia);
    markers.add(sudafrica);
    markers.add(paraguay);
    markers.add(argentina);
    markers.add(chile);
    markers.add(canada);
    markers.add(italia);
    markers.add(ecuador);
    markers.add(korea);
    setState(() {});
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
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 250.0,
                    child: GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: const CameraPosition(
                          target: LatLng(9.915085533193173, -84.0457210670351),
                          zoom: 5),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: markers.map((e) => e).toSet(),
                    )),
              ],
            ),
            const Text(
              'Nuestras Oficinas',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Oficina Central Costa Rica',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                letterSpacing: 3,
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SafeArea(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'CONTÁCTANOS',
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                            width: 150.0,
                            child: Divider(
                              thickness: 1,
                              color: Colors.red,
                            ),
                          ),
                          Card(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: ListTile(
                                leading: const Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                                title: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 13.5,
                                        color: Colors.teal.shade900,
                                      ),
                                      text: "+506 2272-6772",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          sendPhone();
                                        }),
                                ]))),
                          ),
                          Card(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: ListTile(
                                leading: const Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                title: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 13.5,
                                        color: Colors.teal.shade900,
                                      ),
                                      text: "operaciones@grupocastrofallas.com",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          sendO();
                                        }),
                                ]))),
                          ),
                          Card(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: ListTile(
                                leading: const Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                title: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 13.5,
                                        color: Colors.teal.shade900,
                                      ),
                                      text: "costarica@grupocastrofallas.com",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          sendCR();
                                        }),
                                ]))),
                          ),
                          Card(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: ListTile(
                                leading: const Icon(
                                  Icons.message,
                                  color: Colors.black,
                                ),
                                title: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 13.5,
                                        color: Colors.teal.shade900,
                                      ),
                                      text: "WhatsApp +506 7005-1261",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          sendWa();
                                        }),
                                ]))),
                          ),
                          const SizedBox(
                            height: 20.0,
                            width: 250.0,
                            child: Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'COSTA RICA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "costarica@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendCR();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'CHINA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "china@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendC();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'PERÚ',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "peru@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendP();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'BRASIL',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "brasil@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendB();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'MÉXICO',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "mexico@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendM();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'USA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "usa@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendU();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'GUATEMALA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "guatemala@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendG();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'PANAMÁ',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "panama@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendPa();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'JAPÓN',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "japon@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendJ();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'EL SALVADOR',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "salvador@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendS();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'INDIA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "india@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendI();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'ALEMANIA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "alemania@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendA();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'COLOMBIA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "colombia@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendCo();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'ESPAÑA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "espana@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendE();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'HOLANDA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "holanda@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendH();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'NICARAGUA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "nicaragua@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendN();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'HONDURAS',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "honduras@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendHo();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'FRANCIA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "francia@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendF();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'INDONESIA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "indonesia@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendIn();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'TAIWÁN',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "taiwan@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendT();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'THAILANDIA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "thailandia@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendTh();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'SUDÁFRICA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "sudafrica@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendSu();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'PARAGUAY',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "paraguay@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendPar();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'ARGENTINA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "argentina@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendAr();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'CHILE',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "chile@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendCh();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'CANADÁ',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "canada@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendCa();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'ITALIA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "italia@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendIt();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'ECUADOR',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "ecuador@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendEc();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff282626),
                                      ),
                                      child: Column(
                                        children: [
                                          const Card(
                                            color: Color(0xff282626),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'KOREA',
                                                style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color(0xff282626),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 09.0),
                                            child: ListTile(
                                                leading: const Icon(
                                                  Icons.email,
                                                  color: Colors.white,
                                                ),
                                                title: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 13.5,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          "korea@grupocastrofallas.com",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              sendK();
                                                            }),
                                                ]))),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
