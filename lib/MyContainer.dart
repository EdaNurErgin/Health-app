import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  //bir ifadenin türünü öğrenmek için
  // üstüne tıkla ve ctrl+Q YAP
  final void Function()? onPress;

  final Color renk;
  final Widget? child; //bir null degere atamak gerektigi icin ? işareti koyduk
  MyContainer({this.renk = Colors.white, this.child, this.onPress});
  //nasıl bir dizi tanimladgmzda boyutunu ilk 0 olarak tanmlamak
  //gerekiyorsa bu da onun gibi bir durum

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: renk,
        ),
        child: child,
      ),
    );
  }
}
