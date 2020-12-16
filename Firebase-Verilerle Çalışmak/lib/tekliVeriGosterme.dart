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
        body: FutureBuilder(
            future:
                db.collection("users").document("gdaE4A3SjzZwwDIWnIhc").get(),
            builder: (context, snapshot) {
              //snapshotta veri yoksa veya tamamlanmadıysa spinner görünsün..
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              Users user_2 = Users.dokumandanUret(snapshot.data);

              return ListTile(
                title: Text(user_2.isim + " " + user_2.soyad),
                subtitle: Text(user_2.eposta),
                leading: Image(
                  image: NetworkImage(user_2.avatar),
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
              );
            }));
  }
}
