import 'package:flutter/material.dart';
import 'package:nrich/constants.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController textEditingController;

  final String hintText;
  bool obscuretext;

  PasswordField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.obscuretext,
  });

  @override
  State<PasswordField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 340),
      child: TextFormField(
        obscureText: widget.obscuretext,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
                widget.obscuretext ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                widget.obscuretext = !widget.obscuretext;
              });
            },
          ),
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
