import 'package:flutter/material.dart';
import 'package:nrich/constants.dart';
import 'package:nrich/login.dart';
import 'package:nrich/widget/gradient_button.dart';
import 'package:nrich/widget/login_field.dart';
import 'package:nrich/widget/password_field.dart';
import 'package:nrich/widget/social.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _email = TextEditingController();
    final TextEditingController _username = TextEditingController();
    final TextEditingController _password = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/signin_balls.png'),
            const Text(
              'SignUp',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                  backgroundColor: Colors.black,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () => authController.pickImage(),
                    icon: const Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            LoginField(
              obscuretext: false,
              hintText: 'Username',
              textEditingController: _username,
            ),
            const SizedBox(
              height: 15,
            ),
            LoginField(
              obscuretext: false,
              hintText: 'Email',
              textEditingController: _email,
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
                text: 'Sign Up',
                onPressed: () => authController.registerUser(_username.text,
                    _email.text, _password.text, authController.Profilephoto)),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Flexible(
            //       //flex: 1,
            //       fit: FlexFit.tight,
            //       child: Container(
            //         //width: width/2,
            //         height: 2,
            //         color: Colors.white,
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 5,
            //       height: 2,
            //     ),
            //     Text(
            //       "OR",
            //       textAlign: TextAlign.center,
            //     ),
            //     const SizedBox(
            //       width: 5,
            //       height: 2,
            //     ),
            //     Flexible(
            //       //flex: 1,
            //       fit: FlexFit.tight,
            //       child: Container(
            //         //width: width/2,
            //         height: 2,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ],
            // ),

            // const SizedBox(
            //   height: 20,
            // ),
            // const SocialButton(
            //     iconPath: 'assets/svgs/g_logo.svg',
            //     label: 'Continue with Google'),
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
                      builder: (context) => LoginScreen(),
                    ),
                  ),
                  child: Text(
                    'Sign In',
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
