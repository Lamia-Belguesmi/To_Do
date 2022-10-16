import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';

class Buttons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  Buttons({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color:kBgColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
