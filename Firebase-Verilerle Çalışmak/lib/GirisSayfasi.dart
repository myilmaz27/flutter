import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseornek/models/users.dart';
import 'package:firebaseornek/services/benimAuthServisim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GirisSayfasi extends StatelessWidget {
  const GirisSayfasi({Key key}) : super(key: key);
  anonimGirisYap(BuildContext context) async {
    var _benimAuthServisim =
        Provider.of<BenimAuthServisim>(context, listen: false);
    Users kullanici = await _benimAuthServisim.ananimGiris();
    //return kullanici.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 80.0,
          width: 120.0,
          color: Colors.grey,
          child: Center(
            child: InkWell(
                onTap: () => anonimGirisYap(context), child: Text("Giriş Yap")),
          ),
        ),
      ),
    );
  }
}
