import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:nrich/controller/authcontroller.dart';
import 'package:nrich/controller/get_movie.dart';

class Pallete {
  static const Color backgroundColor = Color.fromRGBO(24, 24, 32, 1);
  static const Color gradient1 = Color.fromRGBO(187, 63, 221, 1);
  static const Color gradient2 = Color.fromRGBO(251, 109, 169, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color whiteColor = Colors.white;
}

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
var authController = AuthController.instance;
var tvShows = GetMovieApi.instance;
// StreamBuilder(
          //     stream: FirebaseFirestore.instance
          //         .collection("users")
          //         .where("uid", isEqualTo: firebaseAuth.currentUser!.uid)
          //         .snapshots(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return ListView.builder(
          //           itemCount: snapshot.data?.docs.length,
          //           shrinkWrap: true,
          //           itemBuilder: (context, i) {
          //             var data = snapshot.data!.docs[i];
          //             return Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   'Welcome Back!',
          //                   style: TextStyle(fontSize: 30),
          //                 ),
          //                 SizedBox(
          //                   height: 15,
          //                 ),
          //                 CircleAvatar(
          //                   radius: 66,
          //                   backgroundColor: Pallete.whiteColor,
          //                   child: CircleAvatar(
          //                     radius: 64,
          //                     backgroundColor: Pallete.whiteColor,
          //                     backgroundImage: NetworkImage(data['profilePic']),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 15,
          //                 ),
          //                 Text(
          //                   'Username:${data['name'].toString().capitalize}',
          //                   style: TextStyle(fontSize: 20),
          //                 ),
          //                 SizedBox(
          //                   height: 20,
          //                 ),
          //                 Text(
          //                   'Email:\t${data['email'].toString().capitalize}',
          //                   style: TextStyle(fontSize: 20),
          //                 )
          //               ],
          //             );
          //           },
          //         );
          //       } else {
          //         return Center(
          //             child: CircularProgressIndicator(
          //           color: Pallete.whiteColor,
          //         ));
          //       }
          //     })