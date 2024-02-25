import 'package:sunshine/utils.dart';

import 'package:sunshine/Onboarding Screens/Onboarding Views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;

  runApp(MainApp(onboardingCompleted: onboardingCompleted!));
}
/*
void main()  {
  runApp( const MainApp());
}*/

class MainApp extends StatelessWidget {
  final bool onboardingCompleted;
  const MainApp({Key? key, required this.onboardingCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.outfit().fontFamily,
        textTheme: GoogleFonts.outfitTextTheme(),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow)
            .copyWith(
                primary: AppColors.primary, secondary: AppColors.primaryvariant)
            .copyWith(background: AppColors.background),
      ),
      // initialRoute: Locale._cachedLocaleString == null ? '/onboarding' : '/home',
      // onGenerateRoute: RouteGenerator.generateRoute,
      home: onboardingCompleted ? const OnboardingOne() : const OnboardingOne(),
    );
  }
}
