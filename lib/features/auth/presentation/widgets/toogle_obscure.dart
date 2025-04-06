import 'package:flutter/material.dart';

class ToogleObscure extends StatelessWidget {
  const ToogleObscure({super.key, required this.obscureText});
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    if (obscureText) {
      return IconButton(onPressed: () {}, icon: const Icon(Icons.visibility));
    } else {
      return IconButton(
        onPressed: () {},
        icon: const Icon(Icons.visibility_off),
      );
    }
  }
}
