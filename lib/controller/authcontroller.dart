import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:image_picker/image_picker.dart';
import 'package:nrich/constants.dart';
import 'package:nrich/screen/homepage.dart';
import 'package:nrich/screen/login.dart';
import 'package:nrich/usermodel.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  late Rx<File?> _pickedImage;
  @override
  void onReady() {
    // TODO: implement onReady
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _initialScreen);

    super.onReady();
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  void pickImage() async {
    final pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      Get.snackbar('Profile Picture', 'Profile Picture selected Successfully');
    }
    _pickedImage = Rx<File?>(File(pickImage!.path));
  }

  File? get Profilephoto => _pickedImage.value;
  User get user => _user.value!;

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilepic')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //save data
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String donwloadUrl = await _uploadToStorage(image);
        Usermodel user = Usermodel(
            email: email,
            name: username,
            profilePic: donwloadUrl,
            uid: cred.user!.uid);
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        firebaseAuth.authStateChanges().listen((User? user) {
          if (user == null) {
            print("Successfully signed out");
          } else {
            Get.snackbar('Successfully Registered',
                'Registration process completed successfully');
          }
        });
      } else {
        Get.snackbar(
            'Error Registring the user', 'Please enter all the fields');
      }
    } catch (e) {
      Get.snackbar('Error Registring the user', e.toString());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print('success');
        Get.snackbar('Login Successfull', 'Enjoy your experience');
      } else {
        Get.snackbar('Login Failed', 'Please enter all the fields');
      }
    } catch (e) {
      Get.snackbar('Login Failed', 'Please check your EmailID and Password');
    }
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
   

    return await firebaseAuth.signInWithCredential(credential);
  }
}
