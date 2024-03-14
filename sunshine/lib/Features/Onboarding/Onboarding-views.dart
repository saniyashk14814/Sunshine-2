import 'package:sunshine/Core/Theme/utils.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/Core/Theme/widgets.dart';
import 'package:sunshine/Features/Onboarding/SplashScreen.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      animate: true,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            opacity: 0.5,
            fit: BoxFit.cover,
          ),
          color: Color(0xFFFFF9E4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceInDown(
              animate: true,
              from: 0,
              duration: const Duration(seconds: 1),
              child: const Image(
                image: AssetImage('assets/images/lumen.png'),
                width: 170,
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Hiii! I am ',
                    style: GoogleFonts.outfit(
                        color: AppColors.dark,
                        fontSize: 32,
                        wordSpacing: 2.0,
                        letterSpacing: 1.0,
                        decoration: TextDecoration.none),
                  ),
                  TextSpan(
                    text: 'Lumen',
                    style: GoogleFonts.outfit(
                      color: AppColors.primary,
                      fontSize: 32,
                      letterSpacing: 1.0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            FadeInUp(
              animate: true,
              from: 0,
              duration: const Duration(seconds: 1),
              child: Text(
                'Like the sun I am here to bring warmth\nand melt your worries away',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: AppColors.grey,
                  fontSize: 21.5,
                  letterSpacing: 0.7,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 45),
            FadeInUp(
              animate: true,
              from: 0,
              duration: const Duration(seconds: 1),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreenTwo(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Ionicons.arrow_forward_outline,
                    color: AppColors.dark,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      animate: true,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            opacity: 0.6,
            fit: BoxFit.cover,
          ),
          color: AppColors.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceInDown(
              animate: true,
              duration: const Duration(seconds: 1),
              child: const Image(
                image: AssetImage('assets/images/lumen.png'),
                width: 170,
              ),
            ),
            const SizedBox(height: 30),
            FadeInUp(
              animate: true,
              child: const TextWidget(
                  text:
                      'Welcome to Sunrise! your \n  mental well-being \n companion.',
                  color: AppColors.dark,
                  fontSize: 36,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  height: 1.3),
            ),
            const SizedBox(height: 10),
            FadeInUp(
              animate: true,
              duration: const Duration(seconds: 1),
              child: Text(
                "We're here to support you with daily check-ins,\n peer connections, and uplifting messages.",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: AppColors.grey,
                  fontSize: 21.5,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.20),
            FadeInUp(
              animate: true,
              duration: const Duration(seconds: 1),
              child: ButtonWidget(
                text: "Let's Get Started",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
