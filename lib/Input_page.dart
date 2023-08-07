import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklenti/Constant.dart';
import 'package:yasam_beklenti/result_page.dart';
import 'package:yasam_beklenti/user_date.dart';

import './Icon_Cinsiyet.dart';
import './MyContainer.dart';

//lutfen kullandıgın sınıflari import etmeyi unutma !!!

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilensigara = 20.0;
  double sporgunu = 16;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton(
                        'boy'), //string parametre aldıgından tırnaga aldik
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('kilo'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Haftada kac gun spor yapıyorsunuz ? ',
                    style: kMetinStili,
                  ),
                  Text(
                    '${sporgunu.round().toString()}', //double ifadeyi en yakın tam sayıya yuvarlar
                    style: kSayilarinStili,
                  ),
                  Slider(
                    min: 0,
                    max: 36,
                    divisions: 7,
                    value: sporgunu,
                    onChanged: (double newValue) {
                      setState(() {
                        sporgunu = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Gunde kac sigara iciyosun ? ',
                    style: kMetinStili,
                  ),
                  Text(
                    '${icilensigara.round().toString()}', //double ifadeyi en yakın tam sayıya yuvarlar
                    style: kSayilarinStili,
                  ),
                  Slider(
                    min: 0,
                    max: 36,
                    value: icilensigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilensigara = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.pinkAccent
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: 'KADIN',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.lightBlueAccent
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: 'erkek',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: Size(double.infinity, 10),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              UserData(
                                  kilo: kilo,
                                  boy: boy,
                                  seciliCinsiyet: seciliCinsiyet,
                                  sporgunu: sporgunu,
                                  icilensigara: icilensigara),
                            )));
              },
              child: Text(
                'Hesapla',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: kMetinStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == 'boy'
                ? boy.toString()
                : kilo
                    .toString(), //int ifadeyi makinenin anlayaccagı stringe ceviriyo
            style: kSayilarinStili,
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.lightBlue, //BUTONUN RENGİ
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    label == 'boy' ? boy++ : kilo++;
                  });
                  print('ustteki butona basildi');
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ButtonTheme(
              minWidth: 5,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.lightBlue, //BUTONUN RENGİ
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    label == 'boy' ? boy-- : kilo--;
                  });
                  print('alttaki butona basildi');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//refactor//extract flutter witget adımlarını ilgili kod bloguna
// uygulayarak class  ekleyebilirsin

//bir ifadenin türünü öğrenmek için üstüne tıkla ve ctrl+Q YAP
