import 'package:flutter/material.dart';
import 'package:nrich/constants.dart';

class LoginField extends StatefulWidget {
  final TextEditingController textEditingController;

  final String hintText;
  final bool obscuretext;

  const LoginField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.obscuretext,
  });

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 340),
      child: TextFormField(
        obscureText: widget.obscuretext,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          hintText: widget.hintText,
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
