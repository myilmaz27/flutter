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

  kullaniciEkle() {
    db
        .collection("users")
        .add({
          "isim": "Ayşe",
          "soyad": "Yılmaz",
          "mail": "selim@yilmaz.com",
          "avatar":
              "https://cdn.pixabay.com/photo/2017/05/17/12/42/tiger-2320819_1280.jpg"
        })
        .then((makbuz) => print(makbuz.documentID))
        .catchError((hata) {
          print("Kullanıcı eklenemedi:$hata");
        });
  }

  kimlikleKullaniciEkle() {
    db
        .collection("users")
        .document("abc1")
        .setData({
          "isim": "Fatma",
          "soyad": "Yılmaz",
          "mail": "selim@yilmaz.com",
          "avatar":
              "https://cdn.pixabay.com/photo/2017/05/17/12/42/tiger-2320819_1280.jpg"
        })
        .then((_) => print("Kullanıcı Eklendi"))
        .catchError((hata) {
          print("Kullanıcı eklenemedi:$hata");
        });
  }

  kullaniciGuncelle() {
    db
        .collection("users")
        .document("abc")
        .updateData({
          "isim": "Fatma",
          "soyad": "Yılmaz",
          "mail": "fatma@yilmaz.com",
          "avatar":
              "https://cdn.pixabay.com/photo/2017/01/12/21/42/amurtiger-1975790__180.jpg"
        })
        .then((_) => print("Kullanıcı güncellendi"))
        .catchError((hata) {
          print("Kullanıcı Güncellenemedi:$hata");
        });
  }

  kullaniciSil(String id) {
    db
        .collection("users")
        .document(id)
        .delete()
        .then((_) => print("Kullanıcı silindi"))
        .catchError((hata) {
      print("Kullanıcı Silinemedi:$hata");
    });
  }

  @override
  void initState() {
    super.initState();
    //kullaniciEkle();
    //kullaniciSil("abc1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: db.collection("users").snapshots(),
          builder: (contect, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            List<Users> kullanicilar = snapshot.data.documents
                .map((doc) => Users.dokumandanUret(doc))
                .toList();

            return ListView.builder(
                itemCount: kullanicilar.length,
                itemBuilder: (context, pozisyon) {
                  return ListTile(
                    title: Text(kullanicilar[pozisyon].isim),
                    subtitle: Text(kullanicilar[pozisyon].eposta),
                    leading: Image(
                      image: NetworkImage(kullanicilar[pozisyon].avatar),
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  );
                });
          }),
    );
  }
}
