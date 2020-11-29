import 'package:flutter/material.dart';

class GonderiKarti extends StatelessWidget {
  final String profilresim;
  final String profilisim;
  final String gonderizamani;
  final String paylasimyazi;
  final String paylasimresim;

  GonderiKarti({
    this.profilresim,
    this.profilisim,
    this.gonderizamani,
    this.paylasimyazi,
    this.paylasimresim,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
            padding: EdgeInsets.all(15.0),
            width: double.infinity,
            height: 388.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                  image: NetworkImage(profilresim),
                                  fit: BoxFit.cover,
                                ))),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profilisim,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              gonderizamani,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_vert),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  paylasimyazi,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Image.network(
                  paylasimresim,
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IkonluButonum(
                      ikonum: Icons.favorite,
                      yazi: "Beğen",
                      fonksiyon: () {
                        print("Beğen Butonu");
                      },
                    ),
                    IkonluButonum(
                      ikonum: Icons.comment,
                      yazi: "Yorum",
                      fonksiyon: () {
                        print("Yorum Butonu");
                      },
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Colors.grey,
                      ),
                      label: Text(
                        "Paylaş",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class IkonluButonum extends StatelessWidget {
  final IconData ikonum;
  final String yazi;
  final fonksiyon;

  IkonluButonum({this.ikonum, this.yazi, this.fonksiyon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: fonksiyon,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                ikonum,
                color: Colors.grey,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                yazi,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
