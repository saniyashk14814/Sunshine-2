import 'package:flutter/material.dart';
import 'package:sunshine/Features/Onboarding/splash_screen.dart';
import 'package:sunshine/Core/utils.dart';
import 'package:sunshine/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        textTheme: GoogleFonts.outfitTextTheme().copyWith(),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow)
            .copyWith(primary: const Color(0xFFFFC800))
            .copyWith(background: const Color(0xFFFDFAEF)),
      ),
      home: const Scaffold(body: SplashScreen()),
    );
  }
}
