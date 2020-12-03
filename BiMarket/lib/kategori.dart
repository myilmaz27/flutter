import 'package:flutter/material.dart';
import 'package:marketim/urundetay.dart';

class Kategori extends StatefulWidget {
  final String kategori;

  const Kategori({Key key, this.kategori}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List<Widget> urunlistesi;

  @override
  void initState() {
    super.initState();
    if (widget.kategori == "Kitap") {
      urunlistesi = [
        urunKarti(
          "Antika Kitap",
          "20 TL",
          "https://cdn.pixabay.com/photo/2018/07/01/20/01/book-3510326__340.jpg",
          mevcut: true,
        ),
        urunKarti(
          "Kitap2",
          "30 TL",
          "https://cdn.pixabay.com/photo/2016/09/10/17/18/book-1659717__340.jpg",
          mevcut: false,
        ),
        urunKarti(
          "Saat",
          "60 TL",
          "https://cdn.pixabay.com/photo/2016/12/08/15/42/time-1892012_960_720.png",
          mevcut: true,
        )
      ];
    } else if (widget.kategori == "Giyim") {
      urunlistesi = [
        urunKarti(
          "Gömlek",
          "30 TL",
          "https://cdn.pixabay.com/photo/2016/12/12/20/34/shirt-1902601__340.jpg",
          mevcut: true,
        ),
      ];
    } else if (widget.kategori == "İçecekler") {
      urunlistesi = [
        urunKarti(
          "Meyve Suyu",
          "5 TL",
          "https://cdn.pixabay.com/photo/2015/08/25/16/12/lime-907124__340.jpg",
          mevcut: false,
        )
      ];
    } else if (widget.kategori == "Temizlik") {
      urunlistesi = [
        urunKarti(
          "fırça",
          "3 TL",
          "https://cdn.pixabay.com/photo/2016/11/19/00/17/broom-1837434__340.jpg",
          mevcut: true,
        )
      ];
    }
  }

  Widget urunKarti(String urunisim, String urunfiyat, String urunresim,
      {bool mevcut}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UrunDetay(
                      isim: urunisim,
                      fiyat: urunfiyat,
                      urunresim: urunresim,
                      mevcut: mevcut,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: urunisim,
              child: Container(
                width: 120.0,
                height: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(urunresim),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              urunisim,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              urunfiyat,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.red[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      padding: EdgeInsets.all(10.0),
      childAspectRatio: 1.0,
      children: urunlistesi,
    );
  }
}
