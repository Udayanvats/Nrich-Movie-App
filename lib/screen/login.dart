import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nrich/constants.dart';
import 'package:nrich/screen/homepage.dart';
import 'package:nrich/screen/signup.dart';
import 'package:nrich/controller/widget/gradient_button.dart';

import 'package:nrich/controller/widget/login_field.dart';
import 'package:nrich/controller/widget/password_field.dart';
import 'package:nrich/controller/widget/social.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(LoginController());
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/signin_balls.png'),
            const Text(
              'SignIn',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const SizedBox(
              height: 50,
            ),
            LoginField(
              hintText: 'Email',
              textEditingController: _email,
              obscuretext: false,
            ),
            const SizedBox(
              height: 15,
            ),
            PasswordField(
              obscuretext: true,
              hintText: 'Password',
              textEditingController: _password,
            ),
            SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Text('Dont Have an Account Yet?'),
            //     SizedBox(
            //       height: 10,
            //       width: 10,
            //     ),
            //     Text('SignUp here'),
            //     SizedBox(
            //       width: 10,
            //       height: 10,
            //     ),
            //   ],
            // ),

            // SocialButton(
            //   iconPath: 'assets/svgs/f_logo.svg',
            //   label: 'Continue with Facebook',
            //   horizontalPadding: 60,
            // ),
            const SizedBox(
              height: 30,
            ),
            GradientButton(
              text: 'Sign in',
              onPressed: () =>
                  authController.loginUser(_email.text, _password.text),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  //flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    //width: width/2,
                    height: 2,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 5,
                  height: 2,
                ),
                Text(
                  "OR",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 5,
                  height: 2,
                ),
                Flexible(
                  //flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    //width: width/2,
                    height: 2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            SocialButton(
                iconPath: 'assets/svgs/g_logo.svg',
                label: 'Continue with Google',
                onPressed: () => authController.signInWithGoogle()),

            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t Have An Account Yet? '),
                // SizedBox(
                //   width: 10,
                // ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Pallete.gradient3, fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
