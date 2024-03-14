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
        textTheme: GoogleFonts.outfitTextTheme().copyWith(
          displayLarge: GoogleFonts.outfit(),
          displayMedium: GoogleFonts.outfit(),
          displaySmall: GoogleFonts.outfit(),
          headlineMedium: GoogleFonts.outfit(),
          headlineSmall: GoogleFonts.outfit(),
          titleLarge: GoogleFonts.outfit(),
          titleMedium: GoogleFonts.outfit(),
          titleSmall: GoogleFonts.outfit(),
          bodyLarge: GoogleFonts.outfit(),
          bodyMedium: GoogleFonts.outfit(),
          labelLarge: GoogleFonts.outfit(),
          bodySmall: GoogleFonts.outfit(),
          labelSmall: GoogleFonts.outfit(),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow)
            .copyWith(primary: const Color(0xFFFFC800))
            .copyWith(background: const Color(0xFFFDFAEF)),
      ),
      home: const Scaffold(body: SplashScreen()),
    );
  }
}
