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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: db.collection("users").snapshots(),
          builder: (contect, snapshot) {
            if (!snapshot.hasData) {
              CircularProgressIndicator();
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
