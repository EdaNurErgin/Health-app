import 'package:flutter/material.dart';
import 'package:yasam_beklenti/Constant.dart';

class IconCinsiyet extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;

  IconCinsiyet({required this.cinsiyet, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black,
        ),
        SizedBox(
          //sembol ilee text arasında mesafe koyduk
          height: 20,
        ),
        Text(
          cinsiyet, //null kontrolü
          style: kMetinStili,
        ),
      ],
    );
  }
}
