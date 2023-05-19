// ignore_for_file: prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter, file_names, prefer_if_null_operators, library_private_types_in_public_api, prefer_is_empty

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/globales.dart';
import 'TramitesLogisticosScreen.dart';

class ActivosTL extends StatefulWidget {
  const ActivosTL({Key? key}) : super(key: key);
  Widget verticalSpace({double? space}) => SizedBox(height: space ?? 10.0);
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<ActivosTL> {
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
        'https://dynamicscf.azurewebsites.net/dynamics/listarClienteA?name=$codigo'));
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
                      Column(
                        children: [
                          Text(
                            dataA![index]['title'],
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            dataA![index]['new_bcf'] != null
                                ? dataA![index]['new_bcf']
                                : " ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            dataA![index]['new_contenedor'] != null
                                ? dataA![index]['new_contenedor']
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
                              builder: (context) => TramitesLogisticosScreen(
                                dataA![index]['title'],
                                preestado(dataA![index]['new_preestado2']),
                                formatDOB(dataA![index]['modifiedon']),
                                dataA![index]['new_statuscliente'],
                                incoterm(dataA![index]['new_incoterm']),
                                transporte(dataA![index]['new_transporte']),
                                origen(dataA![index]['new_origen']),
                                destino(dataA![index]['new_destino']),
                                dataA![index]['new_bcf'],
                                cantidadE(dataA![index]['new_cantequipo']),
                                tamanio(dataA![index]['new_tamaoequipo']),
                                dataA![index]['new_contenedor'],
                                dataA![index]['new_seal'],
                                shipper(dataA![index]['_new_shipper_value']
                                    .toString()),
                                dataA![index]['new_contidadbultos'],
                                dataA![index]['new_commodity'],
                                dataA![index]['new_factura'],
                                dataA![index]['new_po'],
                                dataA![index]['new_new_facturacompaia'],
                                pol(dataA![index]['new_pol']),
                                formatDOB(dataA![index]['new_etd1']),
                                formatDOB(
                                    dataA![index]['new_confirmacinzarpe']),
                                poe(dataA![index]['new_poe']),
                                formatDOB(dataA![index]['new_eta']),
                                almacen(dataA![index]['new_lugarcolocacion'],
                                    dataA![index]['new_redestino']),
                                ingreso(dataA![index]['new_ingreso'],
                                    dataA![index]['new_ingresoabodegas']),
                                dataA![index]['new_nombrebuque'],
                                dataA![index]['new_numeroviaje'],
                                dataA![index]['new_diasdetransito'].toString(),
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              preestado(dataA![index]['new_preestado2']),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              pol(dataA![index]['new_pol']),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 12),
                            ),
                            Text(
                              poe(dataA![index]['new_poe']),
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

  String origen(value) {
    switch (value) {
      case 100000000:
        return 'Estados Unidos';
      case 100000003:
        return 'Thailandia';
      case 100000001:
        return 'China';
      case 100000020:
        return 'Alemania';
      case 100000033:
        return 'Argentina';
      case 100000035:
        return 'Bangladesh';
      case 100000027:
        return 'Brasil';
      case 100000017:
        return 'Canadá';
      case 100000006:
        return 'Chile';
      case 100000007:
        return 'Colombia';
      case 100000008:
        return 'Costa Rica';
      case 100000005:
        return 'Ecuador';
      case 100000030:
        return 'Emiratos Arabes';
      case 100000013:
        return 'España';
      case 100000023:
        return 'Francia';
      case 100000002:
        return 'Guatemala';
      case 100000016:
        return 'Holanda';
      case 100000004:
        return 'India';
      case 100000034:
        return 'Indonesia';
      case 100000010:
        return 'Italia';
      case 100000032:
        return 'Japon';
      case 100000011:
        return 'Korea';
      case 100000009:
        return 'Mexico';
      case 100000021:
        return 'Nicaragua';
      case 100000018:
        return 'Panamá';
      case 100000024:
        return 'Perú';
      case 100000029:
        return 'Polonia';
      case 100000022:
        return 'Portugal';
      case 100000019:
        return 'Salvador';
      case 100000014:
        return 'San José, Costa Rica';
      case 100000026:
        return 'Sudáfrica';
      case 100000031:
        return 'Suiza';
      case 100000028:
        return 'Taiwán';
      case 100000012:
        return 'Turquía';
      case 100000015:
        return 'Vietnam';
      default:
        return '';
    }
  }

  String pol(value) {
    switch (value) {
      case 100000115:
        return 'Aeropuerto de Roma-Fiumicino';
      case 100000118:
        return 'Aeropuesto Internacional de El Salvador San Óscar Arnulfo Romero y Galdámez';
      case 100000108:
        return 'Alajuela, Costa Rica';
      case 100000052:
        return 'Alemania';
      case 100000124:
        return 'Algeciras, España';
      case 100000042:
        return 'Altamira, Mexico';
      case 100000123:
        return 'Antwerp, Belgica';
      case 100000085:
        return 'Arkansas, USA';
      case 100000049:
        return 'Balboa, Panamá';
      case 100000125:
        return 'Baltimore(Maryland), Estados Unidos';
      case 100000006:
        return 'Bangkok, TH';
      case 100000091:
        return 'Barcelona, España';
      case 100000084:
        return 'Barraquilla, Colombia';
      case 100000080:
        return 'BROOKLYN NY, USA';
      case 100000017:
        return 'Buenaventura, Colombia';
      case 100000002:
        return 'Busan, Korea';
      case 100000063:
        return 'Callao, Peru';
      case 100000040:
        return 'Cartagena, Colombia';
      case 100000107:
        return 'Cartago, Costa Rica';
      case 100000061:
        return 'Charles de Gaulle, Paris';
      case 100000070:
        return 'Charleston, USA';
      case 100000097:
        return 'Chennai, India';
      case 100000122:
        return 'Chittagong, Bangladesh';
      case 100000095:
        return 'Chongqing, China';
      case 100000038:
        return 'Ciudad de Guatemala, Guatemala';
      case 100000114:
        return 'Colon Free Zone, Panama';
      case 100000012:
        return 'Dalian, China';
      case 100000104:
        return 'Dubai, Emiratos Arabes';
      case 100000073:
        return 'Burban, Sudafrica';
      case 100000003:
        return 'Escuintla, Guatemala';
      case 100000037:
        return 'Foshan, China';
      case 100000065:
        return 'Fuzhou, China';
      case 100000079:
        return 'Galveston TX, USA';
      case 100000039:
        return 'Gabze, Turquía';
      case 100000033:
        return 'Genoa, Italia';
      case 100000021:
        return 'Guangzhou, China';
      case 100000031:
        return 'Guayaquil, Ecuador';
      case 100000088:
        return 'Gydnia, Polonia';
      case 100000116:
        return 'Halifax, NS';
      case 100000109:
        return 'Heredia, Costa Rica';
      case 100000045:
        return 'Ho Chi Minh, Vietnam';
      case 100000077:
        return 'Hong Kong, China';
      case 100000069:
        return 'Houlka, MS, USA';
      case 100000022:
        return 'Houston, TX';
      case 100000064:
        return 'Huangpu, China';
      case 100000098:
        return 'ILLINOIS, USA';
      case 100000102:
        return 'JACKSONVILLE, FL';
      case 100000117:
        return 'Jakarta, Indonesia';
      case 100000120:
        return 'La Bruffière, Francia';
      case 100000009:
        return 'Laem Chabang, TH';
      case 100000062:
        return 'Le Havre, Francia';
      case 100000071:
        return 'Lianyungang, China';
      case 100000059:
        return 'Lisboa, Portugal';
      case 100000112:
        return 'Livorno, Italia';
      case 100000010:
        return 'Los Angeles, United States';
      case 100000058:
        return 'Managua, Nicaragua';
      case 100000096:
        return 'Manatee, USA';
      case 100000032:
        return 'Manzanillo, Mexico';
      case 100000093:
        return 'Manzanillo, Panama';
      case 100000048:
        return 'Mersin, Turquia';
      case 100000035:
        return 'Mexico, City';
      case 100000101:
        return 'MIAMI AIRPORT';
      case 100000005:
        return 'Miami, USA';
      case 100000090:
        return 'Milano, Italia';
      case 100000011:
        return 'Mundra, Guajarat, India';
      case 100000056:
        return 'Nanjin, China';
      case 100000066:
        return 'Nanjing, China';
      case 100000020:
        return 'Nansha, China';
      case 100000023:
        return 'New Jersey, USA';
      case 100000028:
        return 'New York, Estados Unidos';
      case 100000024:
        return 'Nhava Sheva, India';
      case 100000015:
        return 'Ningbo, China';
      case 100000121:
        return 'Norfolk, USA';
      case 100000004:
        return 'Nueva Esperanza, Guatemala';
      case 100000030:
        return 'Oakland, Estados Unidos';
      case 100000087:
        return 'Ohio, USA';
      case 100000105:
        return 'Patli, India';
      case 100000072:
        return 'PEARSON INTERNATIONATIONAL APT/TORONTO, Canada';
      case 100000076:
        return 'Pennsylvania, USA';
      case 100000054:
        return 'Peñas Blancas, Costa Rica';
      case 100000083:
        return 'Philadelphia, USA';
      case 100000008:
        return 'Port Everglades, Florida';
      case 100000089:
        return 'PORT HUENEME, USA';
      case 100000050:
        return 'Pto. Acajutla, El Salvador';
      case 100000051:
        return 'Pto. Quetzal, Guatemala';
      case 100000126:
        return 'Puerto Barrios, Guatemala';
      case 100000027:
        return 'Puerto Limón, Costa Rica';
      case 100000036:
        return 'Puerto Moin, CRC';
      case 100000092:
        return 'Puerto Rama, Nicaragua';
      case 100000001:
        return 'Qingdao, China';
      case 100000068:
        return 'Randleman, NC, USA';
      case 100000046:
        return 'Rotterdam, Netherlands';
      case 100000029:
        return 'San Francisco, Estados Unidos';
      case 100000110:
        return 'San José, Costa Rica';
      case 100000067:
        return 'San Pedro Sula, Honduras';
      case 100000074:
        return 'Santos, Brasil';
      case 100000019:
        return 'Savannah, GA';
      case 100000026:
        return 'Shanghái, China';
      case 100000018:
        return 'Shantou, China';
      case 100000043:
        return 'Shekou, China';
      case 100000014:
        return 'Shenzhen, China';
      case 100000111:
        return 'Shimizu, Japón';
      case 100000053:
        return 'SJO, Costa Rica';
      case 100000106:
        return 'Suiza';
      case 100000081:
        return 'Taichung, Taiwan';
      case 100000007:
        return 'Taizhou, China';
      case 100000055:
        return 'Tarragona, España';
      case 100000099:
        return 'Tennessee, USA';
      case 100000057:
        return 'Terminal SJO, Costa Rica';
      case 100000078:
        return 'Texas, U.S.A';
      case 100000082:
        return 'VADO LIGURE, Italia';
      case 100000041:
        return 'Valencia, España';
      case 100000000:
        return 'Valparaiso, Chile';
      case 100000047:
        return 'Vancouver, Canadá';
      case 100000075:
        return 'Veracruz, México';
      case 100000086:
        return 'VLISSINGEN, Países Bajos';
      case 100000103:
        return 'Wilmington, United States';
      case 100000094:
        return 'Winnipeg Airport, Canadá';
      case 100000016:
        return 'Xiamen, China';
      case 100000060:
        return 'Xingang, China';
      case 100000013:
        return 'Yantian, China';
      case 100000025:
        return 'Yichang, China';
      default:
        return '';
    }
  }

  String destino(value) {
    switch (value) {
      case 100000000:
        return 'San José, Costa Rica';
      case 100000001:
        return 'Pto. Moin, Costa Rica';
      case 100000002:
        return 'Pto. Caldera, Costa Rica';
      case 100000003:
        return 'Cartago, Costa Rica';
      case 100000004:
        return 'Guatemala City, Guatemala';
      case 100000005:
        return 'Santa Tecla, La Libertad, El Salvador';
      case 100000017:
        return 'Alemania';
      case 100000039:
        return 'Australia';
      case 100000021:
        return 'Buenaventura, Colombia';
      case 100000030:
        return 'Cartago, Costa Rica';
      case 100000037:
        return 'Chile';
      case 100000018:
        return 'Ciudad de Panama, Panama';
      case 100000020:
        return 'Colombia';
      case 100000010:
        return 'Colon, Panama';
      case 100000015:
        return 'Comalapa, La Paz';
      case 100000024:
        return 'El Salvador';
      case 100000022:
        return 'España';
      case 100000012:
        return 'Guapiles, Costa Rica';
      case 100000008:
        return 'Heredia, Costa Rica';
      case 100000025:
        return 'Honduras';
      case 100000019:
        return 'Managua, Nicaragua';
      case 100000032:
        return 'Mexico';
      case 100000006:
        return 'Miami, CFS';
      case 100000023:
        return 'Miami, USA';
      case 100000031:
        return 'Nicaragua';
      case 100000036:
        return 'Panama';
      case 100000040:
        return 'Paraguay';
      case 100000016:
        return 'Peru';
      case 100000014:
        return 'Pto, Acajutla, El Salvador';
      case 100000011:
        return 'Pto. Quetzal, Guatemala';
      case 100000035:
        return 'Puerto Cabello, Venezuela';
      case 100000009:
        return 'Puerto Maracaibo, Venezuela';
      case 100000033:
        return 'Puerto Rico';
      case 100000007:
        return 'Puerto Rico';
      case 100000029:
        return 'Republica Dominicana';
      case 100000026:
        return 'San Pedro Sula, Honduras';
      case 100000028:
        return 'San Salvador, El Salvador';
      case 100000013:
        return 'San Salvador, El Salvador';
      case 100000034:
        return 'Singapur';
      case 100000027:
        return 'Tegucigalga, Honduras';
      case 100000038:
        return 'Zona Libre, Colon, Panama';
      default:
        return '';
    }
  }

  String poe(value) {
    switch (value) {
      case 100000054:
        return 'Aeropuerto Internacional de Tocumen';
      case 100000048:
        return 'Aeropuerto Internacional La Aurora, Guatemala';
      case 100000050:
        return 'Aeropuerto Internacional Monseñor Oscar A. Romero, El Salvador';
      case 100000014:
        return 'Alemania';
      case 100000020:
        return 'Buenaventura, Colombia';
      case 100000051:
        return 'Bugaba, Panamá';
      case 100000013:
        return 'Callao, Perú';
      case 100000053:
        return 'Cartagena, Colombia';
      case 100000015:
        return 'Ciudad de Panamá, Panamá';
      case 100000009:
        return 'Colon Free Zone, Panamá';
      case 100000041:
        return 'Cristobal, Panamá';
      case 100000052:
        return 'David Panamá';
      case 100000028:
        return 'El Amatillo, El Salvador';
      case 100000043:
        return 'Ensenada, Mexico';
      case 100000025:
        return 'Guasale, Honduras';
      case 100000023:
        return 'Honduras';
      case 100000055:
        return 'La Asuncion Paraguay';
      case 100000024:
        return 'Las Manos, Honduras';
      case 100000021:
        return 'Madrid, España';
      case 100000016:
        return 'Managua, Nicaragua';
      case 100000033:
        return 'Manzanillo, Mexico';
      case 100000010:
        return 'Manzanillo, Panamá';
      case 100000022:
        return 'Miami, U.S.A';
      case 100000047:
        return 'Paso Canoas, Costa Rica';
      case 100000019:
        return 'Pedro Alvarado, Guatemala';
      case 100000003:
        return 'Peñas Blancas, CR';
      case 100000017:
        return 'Peñas Blancas, Nicaragua';
      case 100000056:
        return 'Port Bridgetown, Barbados';
      case 100000007:
        return 'Pt Everglades, Estados Unidos';
      case 100000006:
        return 'Pto. Acajutla, El Salvador';
      case 100000011:
        return 'Pto. Balboa, Panamá';
      case 100000001:
        return 'Pto. Caldera, Costa Rica';
      case 100000005:
        return 'Pto. Quetzal, Guatemala';
      case 100000045:
        return 'Pto. Rama, Nicaragua';
      case 100000037:
        return 'Puerto Cabello, Venezuela';
      case 100000046:
        return 'Puerto Caucedo, Republica Dominicana';
      case 100000032:
        return 'Puerto Corinto, Nicaragua';
      case 100000031:
        return 'Puerto Cortes, Honduras';
      case 100000002:
        return 'Puerto Limón, CR';
      case 100000012:
        return 'Puerto Maracaibo, Venezuela';
      case 100000004:
        return 'Puerto Moin, CR';
      case 100000034:
        return 'Puerto Santo Tomás de Castilla, Guatemala';
      case 100000049:
        return 'Qantas Drive, Eagle Farm, Australia';
      case 100000030:
        return 'Rio Haina, Republica Dominicana';
      case 100000042:
        return 'Rodman, Panamá';
      case 100000040:
        return 'San Antonio, Chile';
      case 100000018:
        return 'San Cristobal, Guatemala';
      case 100000039:
        return 'San José, Costa Rica';
      case 100000035:
        return 'San Juan, Puerto Rico';
      case 100000008:
        return 'San Juan, Puerto Rico';
      case 100000027:
        return 'San Pedro Sula, Honduras';
      case 100000029:
        return 'San Salvador, El Salvador';
      case 100000044:
        return 'Santo Domingo, RD';
      case 100000036:
        return 'Singapore Changi Airport, Singapure';
      case 100000026:
        return 'Tegucipalpa, Honduras';
      case 100000000:
        return 'Terminal SJO, CR';
      case 100000038:
        return 'Zona Libre, Colon, Panamá';
      default:
        return '';
    }
  }

  String incoterm(value) {
    switch (value) {
      case 100000003:
        return 'DDP';
      case 100000004:
        return 'FCA';
      case 100000000:
        return 'EXW';
      case 100000001:
        return 'FOB';
      case 100000002:
        return 'CIF';
      default:
        return '';
    }
  }

  String transporte(value) {
    switch (value) {
      case 100000000:
        return 'Aéreo';
      case 100000001:
        return 'Marítimo';
      case 100000002:
        return 'Terrestre';
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

  String shipper(value) {
    if (value != null || value != "null") {
      fetchShipper(value);
      return ship;
    } else {
      return "";
    }
  }

  String ingreso(value, value2) {
    if ((value == null) && (value2 == null)) {
      return '';
    } else if ((value != null) && (value2 == null)) {
      return formatDOB(value);
    } else if ((value == null) && (value2 != null)) {
      return formatDOB(value2);
    } else {
      return "";
    }
  }

  String almacen(value, value2) {
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
