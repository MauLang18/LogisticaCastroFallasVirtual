// ignore_for_file: file_names, avoid_print, deprecated_member_use

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future sendEmailTI(
    {required String nombre,
    required String apellido,
    required String empresa,
    required String email,
    required String code,
    required String telefono,
    required String servicio,
    required String subject,
    required String detalles}) async {
  String username = 'grupocastrofallascr@gmail.com';
  String password = 'juetknsceshhekta';

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, "Logística Castro Fallas")
    ..recipients.add('pricing@grupocastrofallas.com')
    ..subject = subject
    ..html =
        "<p>Se ha solicitado un tarifario con los siguientes datos: </p><p>Nombre: $nombre Apellido: $apellido</p><p>Empresa: $empresa</p><p>Email: $email</p><p>Teléfono: $code $telefono</p><p>Servicio: $servicio</p><p>Anotaciones: $detalles</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: $sendReport');
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }

  var connection = PersistentConnection(smtpServer);

  await connection.send(message);

  await connection.close();
}

Future sendEmailTC(
    {required String nombre,
    required String servicio,
    required String email,
    required String subject,
    required String detalles}) async {
  String username = 'grupocastrofallascr@gmail.com';
  String password = 'juetknsceshhekta';

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, "Logística Castro Fallas")
    ..recipients.add(email)
    ..subject = subject
    ..html =
        "<p>Buen día $nombre</p><br><p>Hemos recibido su solicitud de tarifario en el servicio $servicio, con las siguientes anotaciones $detalles.</p><br><p>En breve el equipo de Pricing Grupo Castro Fallas, le estaremos colaborando con el envio del tarifario.</p><p>Cualquier duda o consulta email pricing@grupocastrofallas.com</p><br><br><p>Grupo Castro Fallas</p><p>www.logisticacastrofallas.com</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: $sendReport');
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }

  var connection = PersistentConnection(smtpServer);

  await connection.send(message);

  await connection.close();
}

Future sendEmailCI(
    {required String numero,
    required String empresa,
    required String email,
    required String telefono,
    required String importacion,
    required String exportacion,
    required String termino,
    required String servicio,
    required String origen,
    required String destino,
    required String producto,
    required String valor,
    required String peso,
    required String volumen,
    required String seguro,
    required String trnasporte,
    required String aduanas,
    required String almacen,
    required String dimensiones,
    required String observaciones,
    required String subject}) async {
  String username = 'grupocastrofallascr@gmail.com';
  String password = 'juetknsceshhekta';

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, 'Logística Castro Fallas')
    ..recipients.add('pricing@grupocastrofallas.com')
    ..subject = subject
    ..html =
        "<p>Se ha solicitado una cotización con los siguientes datos: </p><p>Numero de Tarifa: $numero</p><p>Empresa: $empresa</p><p>Email: $email</p><p>Teléfono: $telefono</p><p>Tipo de operación: $importacion $exportacion</p><p>Tipo de negociación: $termino</p><p>Servicio: $servicio</p><p>Origen: $origen</p><p>Destino: $destino</p><p>Tipo de producto: $producto</p><p>Valor de la mercancía: $valor</p><p>Peso: $peso</p><p>Volumen: $volumen</p><p>Dimensiones: $dimensiones</p><p>Servicios Integrales: $seguro $trnasporte $aduanas $almacen</p><p>Anotaciones: $observaciones</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: $sendReport');
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }

  var connection = PersistentConnection(smtpServer);

  await connection.send(message);

  await connection.close();
}

Future sendEmailCC(
    {required String numero,
    required String empresa,
    required String email,
    required String telefono,
    required String importacion,
    required String exportacion,
    required String termino,
    required String servicio,
    required String origen,
    required String destino,
    required String producto,
    required String valor,
    required String peso,
    required String volumen,
    required String seguro,
    required String trnasporte,
    required String aduanas,
    required String almacen,
    required String dimensiones,
    required String observaciones,
    required String subject}) async {
  String username = 'grupocastrofallascr@gmail.com';
  String password = 'juetknsceshhekta';

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, 'Logística Castro Fallas')
    ..recipients.add(email)
    ..subject = subject
    ..html =
        "<p>Buen día $empresa</p><br><p>Hemos recibido su solicitud de cotización con el numero de tarifa: $numero, en el tipo de operación $importacion $exportacion, tipo de negociación $termino, en el servicio $servicio.</p><p>Origen: $origen</p><p>Destino: $destino</p><br><p>Para el producto $producto, con un valor de tarifa $valor</p><p>Peso: $peso</p><p>Volumen: $volumen</p><p>Dimensiones: $dimensiones</p><br><p>Adicionalmente se indicaron Servicios Integrales $seguro $trnasporte $almacen $aduanas</p><p>Anotaciones $observaciones.</p><br><p>En breve el equipo de Princing Grupo Castro Fallas, le estaremos colaborando con el envio de cotización.</p><p>Cualquier duda o consulta email pricing@grupocastrofallas.com</p><br><br><p>Grupo Castro Fallas</p><p>www.logisticacastrofallas.com</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: $sendReport');
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }

  var connection = PersistentConnection(smtpServer);

  await connection.send(message);

  await connection.close();
}
