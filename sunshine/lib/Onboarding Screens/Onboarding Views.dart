import 'package:sunshine/utils.dart';

import 'package:sunshine/Onboarding Screens/bloc/onboarding_bloc.dart';

class onboardingScreen extends StatelessWidget {
  const onboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          if (state is OnboardingInitial) {
            return const OnboardingOne();
          } else if (state is OnboardingOneState) {
            return const OnboardingTwo();
          } else if (state is OnboardingTwoState) {
            return const GetStarted();
          } else if (state is GetStartedState) {
            return const OnboardingOne();
          }
          return const OnboardingOne(); // Add a return statement to ensure a Widget is always returned.
        },
      ),
    );
  }
}

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.background,
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            opacity: 0.85,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/lumen.png', height: 175, width: 175),
            const SizedBox(height: 40),
            RichText(
              text: TextSpan(
                text: 'Hiii!, I am',
                style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    color: AppColors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Lumen',
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w600,
                          fontSize: 40,
                          color: AppColors.primary)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Like the sun I am here to bring warmth \n and melt your worries away',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: AppColors.grey,
                fontSize: 20,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                context
                    .read<OnboardingBloc>()
                    .add(OnboardingTwo() as OnboardingEvent);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Icon(
                  Ionicons.arrow_forward,
                  size: 24,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ));
  }
}

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
