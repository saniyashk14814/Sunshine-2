import 'package:flutter/material.dart';
import 'package:sunshine/Core/utils.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.color = AppColors.dark,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500,
      this.height,
      this.textAlign = TextAlign.left});

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double? height;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.outfit(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
        height: height,
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primary,
    this.textColor = AppColors.dark,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
    this.bordercolor = AppColors.primary,
  });

  final String text;
  final Color color;
  final Color textColor;
  final Color bordercolor;
  final double fontSize;
  final FontWeight fontWeight;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        fixedSize: Size.fromWidth(
          MediaQuery.of(context).size.width * 0.85,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
          side: BorderSide(
            width: 1.5,
            color: bordercolor,
          ),
        ),
      ),
      child: TextWidget(
        text: text,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
