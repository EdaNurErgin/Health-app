import 'package:yasam_beklenti/user_date.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc;
    sonuc = 90 + _userData.sporgunu! - _userData.icilensigara!;
    sonuc = sonuc + (_userData.boy! / _userData.kilo!);

    if (_userData.seciliCinsiyet == 'KADIN') {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }
}
