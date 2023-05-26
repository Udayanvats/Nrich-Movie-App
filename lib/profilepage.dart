import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nrich/constants.dart';

import 'widget/login_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        elevation: 0,
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              controller.logout();
            },
          )
        ],
      ),
      backgroundColor: Pallete.backgroundColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset('assets/images/signin_balls.png'),
          CircleAvatar(
              backgroundImage:
                  Image.network(controller.googleAccount.value?.photoUrl ?? '')
                      .image,
              radius: 64),
          SizedBox(
            height: 10,
          ),
          Text(
            controller.googleAccount.value?.displayName ?? '',
            style: Get.textTheme.headlineSmall,
          ),
          Text(
            controller.googleAccount.value?.email ?? '',
            style: Get.textTheme.bodySmall,
          ),
        ],
      )),
    );
  }
}
