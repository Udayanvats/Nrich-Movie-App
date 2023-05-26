import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrich/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        elevation: 0,
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              firebaseAuth.signOut();
            },
          )
        ],
      ),
      backgroundColor: Pallete.backgroundColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset('assets/images/signin_balls.png'),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .where("uid", isEqualTo: firebaseAuth.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      var data = snapshot.data!.docs[i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CircleAvatar(
                            radius: 66,
                            backgroundColor: Pallete.whiteColor,
                            child: CircleAvatar(
                              radius: 64,
                              backgroundColor: Pallete.whiteColor,
                              backgroundImage: NetworkImage(data['profilePic']),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Username:${data['name'].toString().capitalize}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Email:\t${data['email'].toString().capitalize}',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Pallete.whiteColor,
                  ));
                }
              })
        ],
      )),
    );
  }
}
