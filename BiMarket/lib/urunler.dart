import 'package:flutter/material.dart';
import 'package:marketim/kategori.dart';

class Urunler extends StatefulWidget {
  @override
  _UrunlerState createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> with SingleTickerProviderStateMixin {
  TabController tvKontrolcu;

  @override
  void initState() {
    super.initState();
    tvKontrolcu = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: tvKontrolcu,
            indicatorColor: Colors.red[400],
            labelColor: Colors.red[400],
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            labelStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(
                child: Text(
                  "Kitap",
                ),
              ),
              Tab(
                child: Text(
                  "Giyim",
                ),
              ),
              Tab(
                child: Text(
                  "İçecekler",
                ),
              ),
              Tab(
                child: Text(
                  "Temizlik",
                ),
              ),
            ]),
        Expanded(
          child: TabBarView(
            controller: tvKontrolcu,
            children: [
              Kategori(
                kategori: "Kitap",
              ),
              Kategori(
                kategori: "Giyim",
              ),
              Kategori(
                kategori: "İçecekler",
              ),
              Kategori(
                kategori: "Temizlik",
              ),
            ],
          ),
        )
      ],
    );
  }
}
