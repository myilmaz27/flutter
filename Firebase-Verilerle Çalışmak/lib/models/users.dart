import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users {
  final String id;
  final String isim;
  final String soyad;
  final String avatar;
  final String eposta;

  Users({this.id, this.isim, this.soyad, this.avatar, this.eposta});

  factory Users.dokumandanUret(DocumentSnapshot doc) {
    return Users(
      id: doc.documentID,
      isim: doc.data["isim"],
      soyad: doc.data["soyad"],
      eposta: doc.data["mail"],
      avatar: doc.data["avatar"],
    );
  }

  factory Users.firebasedenUret(FirebaseUser kullanici) {
    return Users(
      id: kullanici.uid,
      isim: kullanici.displayName,
      eposta: kullanici.email,
      avatar: kullanici.photoUrl,
    );
  }
}
