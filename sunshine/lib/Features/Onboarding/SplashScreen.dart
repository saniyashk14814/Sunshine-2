import 'package:flutter/material.dart';
import 'package:sunshine/Core/Theme/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/logo.png'),
            width: 125,
          ),
          Text(
            'Sunshine',
            style: GoogleFonts.outfit(
              fontSize: 45,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF09192A),
            ),
          ),
        ],
      ),
    );
  }
}
