import 'package:flutter/material.dart';
import 'package:yasam_beklenti/Constant.dart';
import 'package:yasam_beklenti/hesapla.dart';
import 'package:yasam_beklenti/user_date.dart';

//hesapla butonuna bastktan snra acılacak sayfa
class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sonuc sayfasi'),
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, //butonun sagdan sola yayılmasini saglar
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                Hesap(_userData)
                    .hesaplama()
                    .round()
                    .toString(), //round yuvarlama fonksiyonu
                style: kMetinStili,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context); //EKRANDAN CIK
              },
              child: Text(
                'geri don',
                style: kMetinStili,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
