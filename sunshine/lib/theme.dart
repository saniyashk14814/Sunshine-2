import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFFC800);
  static const Color primaryvariant = Color(0xFFF8ECC3);
  static const Color blue = Color(0xFF2D7DD2);
  static const Color black = Color(0xFF09192A);
  static const Color grey = Color(0xFF899199);
  static const Color background = Color(0xFFFDFAEF);
  static const Color white = Color(0xFFEEF5FB);
  static const Color green = Color(0xFF306B34);
  static const Color greenbg = Color(0xFFEEF3EF);
}

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color bgcolor;
  final double fontsize;
  final FontWeight fontweight;

  const MyButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.bgcolor,
      required this.fontsize,
      required this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: fontweight,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
