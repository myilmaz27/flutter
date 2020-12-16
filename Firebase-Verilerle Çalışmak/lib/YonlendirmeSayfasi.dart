import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseornek/AnaSayfa.dart';
import 'package:firebaseornek/GirisSayfasi.dart';
import 'package:firebaseornek/models/users.dart';
import 'package:firebaseornek/services/benimAuthServisim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YonlendirmeSayfasi extends StatefulWidget {
  @override
  _YonlendirmeSayfasiState createState() => _YonlendirmeSayfasiState();
}

class _YonlendirmeSayfasiState extends State<YonlendirmeSayfasi> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<BenimAuthServisim>(context, listen: false)
            .durumTakipcisi,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            Users aktifkullanici = snapshot.data;
            print(aktifkullanici.id);
            return AnaSayfa();
          } else {
            return GirisSayfasi();
          }
        });
  }
}
