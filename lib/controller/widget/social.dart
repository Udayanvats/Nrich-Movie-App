import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nrich/constants.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onPressed;
  const SocialButton(
      {super.key,
      required this.iconPath,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: SvgPicture.asset(
        iconPath,
        width: 25,
        color: Pallete.whiteColor,
      ),
      label: Text(
        label,
        style: const TextStyle(color: Pallete.whiteColor, fontSize: 17),
      ),
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 25),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Pallete.borderColor, width: 3),
              borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
    );
  }
}
