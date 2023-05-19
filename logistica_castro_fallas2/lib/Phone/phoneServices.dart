// ignore_for_file: file_names

import 'package:url_launcher/url_launcher.dart';

void sendPhone() {
  final Uri url = Uri(
    scheme: 'tel',
    path: '+506 2272-6772',
  );

  // ignore: deprecated_member_use
  launch(url.toString());
}
