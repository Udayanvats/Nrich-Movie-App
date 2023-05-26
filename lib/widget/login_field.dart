import 'package:flutter/material.dart';
import 'package:nrich/constants.dart';

class LoginField extends StatelessWidget {
  final TextEditingController textEditingController;

  final String hintText;
  const LoginField({
    super.key,
    required this.hintText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 340),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Pallete.borderColor, width: 3),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Pallete.gradient2, width: 3),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
