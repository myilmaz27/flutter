//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:marketim/sepetim.dart';
import 'package:marketim/urunler.dart';

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
  List _icerikler;
  int _aktificerikNo = 0;

  @override
  void initState() {
    super.initState();
    _icerikler = [
      Urunler(),
      Sepetim(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red[400]),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "BiMarket",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
      body: _icerikler[_aktificerikNo],
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktificerikNo,
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey[600],
        items: [
          // ignore: deprecated_member_use
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ürünler"),
          // ignore: deprecated_member_use
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Sepetim"),
        ],
        onTap: (int tikalananButtonPozNo) {
          setState(() {
            _aktificerikNo = tikalananButtonPozNo;
          });
        },
      ),
    );
  }
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Ahmet YILMAZ"),
            accountEmail: Text("ahmet@yilmaz.com"),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/03/15/20/07/head-2147328__340.png",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            decoration: BoxDecoration(color: Colors.red[400]),
          ),
          ListTile(
            title: Text("Sirapişlerim"),
            onTap: () {},
          ),
          ListTile(
            title: Text("İndirimlerim"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Ayarlarım"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Çıkış Yap"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
