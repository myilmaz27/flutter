import 'package:flutter/material.dart';
import 'package:sosyalmedya/gonderikarti.dart';

class ProfilSayfasi extends StatelessWidget {
  final String profilresim;
  final String profilisim;
  final String profilnic;
  final String profilkapakresim;
  final String takipcisayi;
  final String takipedilensayi;
  final String paylasimsayi;

  const ProfilSayfasi({
    Key key,
    this.profilresim,
    this.profilisim,
    this.takipcisayi,
    this.takipedilensayi,
    this.paylasimsayi,
    this.profilnic,
    this.profilkapakresim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 230.0,
                //color: Colors.yellow,
              ),
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(profilkapakresim), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 0.0,
                child: Hero(
                  tag: profilnic,
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        border: Border.all(width: 2.0, color: Colors.white),
                        borderRadius: BorderRadius.circular(60.0),
                        image: DecorationImage(
                            image: NetworkImage(profilresim),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
                top: 190.0,
                left: 145.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profilisim,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      profilnic,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 130.0,
                right: 15.0,
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(width: 2.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.add_circle, size: 18.0),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Takip et",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context, true);
                    }),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 75.0,
            color: Colors.grey.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                sayac("Takipçi", takipcisayi),
                sayac("Takip Edilen", takipedilensayi),
                sayac("Paylaşım", paylasimsayi),
              ],
            ),
          ),
          GonderiKarti(
            profilresim:
                "https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_1280.jpg",
            profilisim: "Mehmet Ali YILMAZ",
            gonderizamani: "1 saat önce",
            paylasimyazi: "Bu Ömer'in Köpeği",
            paylasimresim:
                "https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg",
          ),
          GonderiKarti(
            profilresim:
                "https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg",
            profilisim: "Ahmet Akif YILMAZ",
            gonderizamani: "1 saat önce",
            paylasimyazi: "Ahmet Akifin kartalı",
            paylasimresim:
                "https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_1280.jpg",
          ),
        ],
      ),
    );
  }

  Column sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sayi,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          baslik,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
