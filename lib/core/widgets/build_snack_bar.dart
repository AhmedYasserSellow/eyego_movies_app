import 'package:flutter/material.dart';

void buildSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      content: Text(message, style: TextStyle(color: Colors.white)),
    ),
  );
}
