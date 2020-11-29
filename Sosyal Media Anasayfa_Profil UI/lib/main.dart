import 'package:flutter/material.dart';
import 'package:sosyalmedya/gonderikarti.dart';
import 'package:sosyalmedya/profilsayfasi.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
              size: 32.0,
            ),
            onPressed: () {}),
        title: Text(
          "SosyalMedya",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.purple[300],
                size: 32.0,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext contex) {
                      return Column(
                        children: [
                          duyuru("Ahmet Seni Takip etti", "3 dk"),
                          duyuru("Ali Paylaşım Yaptı", "10 dk"),
                        ],
                      );
                    });
              }),
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 5.0),
            ]),
            width: double.infinity,
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                profilKartiolustur(
                  "ayilmaz",
                  "https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_1280.jpg",
                  "Ahmet YILMAZ",
                  "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823__340.jpg",
                  "20K",
                  "500",
                  "80",
                ),
                profilKartiolustur(
                  "memoli",
                  "https://cdn.pixabay.com/photo/2020/03/28/15/20/cat-4977436_1280.jpg",
                  "Mehmet YILMAZ",
                  "https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_1280.jpg",
                  "2K",
                  "289",
                  "50",
                ),
                profilKartiolustur(
                  "Ömer",
                  "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg",
                  "Ömer YILMAZ",
                  "https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg",
                  "150K",
                  "590",
                  "89",
                ),
                profilKartiolustur(
                  "Ayşe",
                  "https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg",
                  "Ayşe YILMAZ",
                  "https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg",
                  "2M",
                  "400",
                  "151",
                ),
                profilKartiolustur(
                  "Mehmet",
                  "https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_1280.jpg",
                  "Metmet KARA",
                  "https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg",
                  "20K",
                  "870",
                  "96",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
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
          GonderiKarti(
            profilresim:
                "https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_1280.jpg",
            profilisim: "Mehmet Ali YILMAZ",
            gonderizamani: "1 saat önce",
            paylasimyazi: "Bu Ömer'in Köpeği",
            paylasimresim:
                "https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.purple[300],
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }

  Padding duyuru(String mesaj, String gecenSure) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mesaj,
            style: TextStyle(fontSize: 15.0),
          ),
          Text(gecenSure),
        ],
      ),
    );
  }

  Widget profilKartiolustur(
    String kullaniciAdi,
    String resimlinki,
    String profilisim,
    String profilkapakresim,
    String takipcisayi,
    String takipedilensayi,
    String paylasimsayi,
  ) {
    return Material(
      child: InkWell(
        onTap: () async {
          bool donenVeri = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProfilSayfasi(
                        profilisim: profilisim,
                        profilresim: resimlinki,
                        profilnic: kullaniciAdi,
                        profilkapakresim: profilkapakresim,
                        takipcisayi: takipcisayi,
                        takipedilensayi: takipedilensayi,
                        paylasimsayi: paylasimsayi,
                      )));
          if (donenVeri) {
            print("Kullanıcı Profilden döndü.");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: kullaniciAdi,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                              image: NetworkImage(resimlinki),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(width: 2.0, color: Colors.white),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                kullaniciAdi,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
