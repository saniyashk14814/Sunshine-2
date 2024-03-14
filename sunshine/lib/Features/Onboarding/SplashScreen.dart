import 'package:flutter/material.dart';
import 'package:sunshine/Core/Theme/utils.dart';
import 'package:sunshine/Features/Onboarding/Onboarding-views.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      animate: true,
      duration: const Duration(milliseconds: 1000),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            opacity: 0.6,
            fit: BoxFit.cover,
          ),
          color: Color(0xFFF8ECC3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceInDown(
              animate: true,
              from: 0,
              duration: const Duration(milliseconds: 1200),
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 125,
              ),
            ),
            BounceInDown(
              onFinish: (direction) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingScreenOne()));
              },
              animate: true,
              duration: const Duration(milliseconds: 1200),
              from: 50,
              child: Text(
                'Sunshine',
                style: GoogleFonts.outfit(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF09192A),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
