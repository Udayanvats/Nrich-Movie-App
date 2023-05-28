import 'package:flutter/material.dart';
import 'package:nrich/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SliverAppBar(
      floating: true,
      leadingWidth: size.width * 0.28,
      backgroundColor: Pallete.backgroundColor,
      centerTitle: true,
      title: Text('EXPLORE'),
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            firebaseAuth.signOut();
          },
        )
      ],
    );
  }
}
