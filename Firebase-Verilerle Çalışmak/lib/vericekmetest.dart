import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/users.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final db = Firestore.instance;
  void kullaniciGetir() async {
    var snapshot = await db.collection("users").getDocuments();
    snapshot.documents.forEach((doc) {
      print(doc.data);
    });
  }

  void kimlikIleKullaniciGetir() async {
    var doc =
        await db.collection("users").document("gdaE4A3SjzZwwDIWnIhc").get();
    if (doc.exists) {
      print(doc.data);
    } else {
      print("Kişi Bulunamadı!");
    }
  }

  void kullaniciSiraliGetir() async {
    var snapshot = await db.collection("users").orderBy("yas").getDocuments();
    snapshot.documents.forEach((doc) {
      print(doc.data);
    });
  }

  void kullaniciSorgula() async {
    var snapshot =
        await db.collection("users").where("yas", isEqualTo: 4).getDocuments();
    snapshot.documents.forEach((doc) {
      print(doc.data);
    });
  }

  void kullaniciCokluSorgula() async {
    var snapshot = await db
        .collection("users")
        .where("soyad", isEqualTo: "Yılmaz")
        .where("yas", isGreaterThan: 4)
        .getDocuments();
    snapshot.documents.forEach((doc) {
      print(doc.data);
    });
  }

  void kullaniciOlustur() async {
    var doc =
        await db.collection("users").document("gdaE4A3SjzZwwDIWnIhc").get();
    Users user_1 = Users.dokumandanUret(doc);

    print(user_1.id);
    print(user_1.isim);
    print(user_1.soyad);
  }

  @override
  void initState() {
    super.initState();
    //kullaniciGetir();
    //kimlikIleKullaniciGetir();
    //kullaniciSiraliGetir();
    //kullaniciSorgula();
    //kullaniciCokluSorgula();
    kullaniciOlustur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Firebase_1"),
      ),
    );
  }
}
