// ignore_for_file: file_names

import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

void sendWa() {
  String url() {
    if (Platform.isAndroid) {
      // add the [https]
      return "https://wa.me/+506 6173-1852/"; // new line
    } else {
      // add the [https]
      return "https://api.whatsapp.com/send?phone=+506 6173-1852"; // new line
    }
  }

  // ignore: deprecated_member_use
  launch(url());
}
