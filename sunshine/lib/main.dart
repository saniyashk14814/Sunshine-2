import 'package:flutter/material.dart';
import 'package:sunshine/Features/Onboarding/SplashScreen.dart';
import 'package:sunshine/Core/Theme/utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.outfit().fontFamily,
        textTheme: GoogleFonts.outfitTextTheme(),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow)
            .copyWith(primary: const Color(0xFFFFC800))
            .copyWith(background: const Color(0xFFFDFAEF)),
      ),
      home: const Scaffold(body: SplashScreen()),
    );
  }
}
