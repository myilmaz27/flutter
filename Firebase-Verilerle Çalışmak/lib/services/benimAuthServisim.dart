import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseornek/models/users.dart';

class BenimAuthServisim {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Users _kullaniciOlustur(FirebaseUser firebaseKullanici) {
    return firebaseKullanici == null
        ? null
        : Users.firebasedenUret(firebaseKullanici);
  }

  Stream<Users> get durumTakipcisi {
    return _firebaseAuth.onAuthStateChanged.map(_kullaniciOlustur);
  }

  Future<Users> ananimGiris() async {
    var authResult = await _firebaseAuth.signInAnonymously();
    return _kullaniciOlustur(authResult.user);
  }

  Future<void> cikisYap() {
    return _firebaseAuth.signOut();
  }
}
