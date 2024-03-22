import 'package:sunshine/Core/username_generator.dart';
import 'package:sunshine/Core/utils.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/Core/widgets.dart';
import 'package:sunshine/Features/Check-In/checkin_views.dart';
import 'package:sunshine/Features/Onboarding/newuser_dialogue.dart';
import 'package:sunshine/Features/error_screen.dart';

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
                  letterSpacing: 0.3,
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
                      builder: (context) => const OnboardingScreenThree(),
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

class OnboardingScreenThree extends StatefulWidget {
  const OnboardingScreenThree({super.key});

  @override
  State<OnboardingScreenThree> createState() => _OnboardingScreenThreeState();
}

class _OnboardingScreenThreeState extends State<OnboardingScreenThree> {
  final googleSignIn = GoogleSignIn();

  String? username;

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    username = await getUsername();
    setState(() {}); // Notify the framework that the state has changed
  }

  Future<String?> usernameGen() async {
    String? usernameFinal = await getUsername();
    if (username == null) {
      // Username not found, generate a new one
      final newUsername = generateUsername();
      await setUsername(newUsername);
      username = newUsername;
    }
    return usernameFinal;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData && username == null) {
          // User not signed in and no username, show onboarding screen
          return onboardingContent(context);
        } else {
          // User signed in, navigate to CheckinScreenOne
          return const CheckInScreenOne();
        }
      },
    );
  }

  Widget onboardingContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          opacity: 0.6,
          fit: BoxFit.cover,
        ),
        color: AppColors.background,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 45),
            FadeIn(
              child: Image(
                image: const AssetImage('assets/images/graphic.png'),
                width: MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(height: 30),
            FadeInUp(
              animate: true,
              duration: const Duration(seconds: 1),
              child: const TextWidget(
                text:
                    'We only care about your well-being so there’s no need for a login, we respect your health and privacy. Just authenticate your school account.',
                color: AppColors.grey,
                fontSize: 20,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: FadeInUp(
                animate: true,
                duration: const Duration(seconds: 1),
                child: ButtonWidget(
                  text: "Authenticate",
                  onPressed: () async {
                    final userCredential = await _signInWithGoogle();
                    final navigator = Navigator.of(context);
                    await usernameGen();

                    if (userCredential != null) {
                      // Navigate to desired screen on successful sign-in
                      navigator.pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => NewUserDialogue(),
                        ),
                      );
                    } else {
                      // Handle sign-in failure
                      navigator.pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const ErrorScreen(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (error) {
      return null;
    }
  }
}
