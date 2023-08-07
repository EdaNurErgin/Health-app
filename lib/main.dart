import 'package:flutter/material.dart';

import './Input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //brightness: Brightness
        // .dark, //arka plan rengi ile textleri arasındaki renk uyumunu saglar
        //ornegin arka plan siyahsa texti beyaz yapar.
        scaffoldBackgroundColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.blue,
        ),
      ),
      home: InputPage(),
    );
  }
}
