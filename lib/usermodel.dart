import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Usermodel {
  String name;
  String profilePic;
  String email;
  String uid;
  Usermodel(
      {required this.name,
      required this.profilePic,
      required this.uid,
      required this.email});

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePic": profilePic,
        "email": email,
        "uid": uid,
      };

  static Usermodel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Usermodel(email: snapshot['email'], name: snapshot['name'], profilePic: snapshot['profilePic'], uid: snapshot['uid']);
  }
}
