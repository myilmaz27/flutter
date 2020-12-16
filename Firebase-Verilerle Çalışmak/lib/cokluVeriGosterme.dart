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

  Future<List<Users>> kullaniciGetir() async {
    QuerySnapshot snapshot = await db.collection("users").getDocuments();
    List<Users> kullanicilar =
        snapshot.documents.map((doc) => Users.dokumandanUret(doc)).toList();
    return kullanicilar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Users>>(
          future: kullaniciGetir(),
          builder: (contect, snapshot) {
            if (!snapshot.hasData) {
              CircularProgressIndicator();
            }

            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, pozisyon) {
                  return ListTile(
                    title: Text(snapshot.data[pozisyon].isim),
                    subtitle: Text(snapshot.data[pozisyon].eposta),
                    leading: Image(
                      image: NetworkImage(snapshot.data[pozisyon].avatar),
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
