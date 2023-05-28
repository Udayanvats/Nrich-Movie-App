import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrich/controller/authcontroller.dart';
import 'package:nrich/constants.dart';
import 'package:nrich/controller/get_movie.dart';
import 'package:nrich/screen/login.dart';
import 'package:nrich/screen/movie_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
    Get.put(GetMovieApi());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nrich Task',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      home: const LoginScreen(),
      routes: {MovieDetialScreen.namedRoute: (ctx) => MovieDetialScreen()},
    );
  }
}
