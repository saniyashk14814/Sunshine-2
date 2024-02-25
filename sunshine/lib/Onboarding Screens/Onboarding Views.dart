import 'package:sunshine/Check-in%20Screens/checkin%20screen.dart';
import 'package:sunshine/utils.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnboardingTwo()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(24),
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
            Text(
              'Welcome to Sunrise! your \n mental well-being \n companion.',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: AppColors.black,
                fontSize: 40,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "We're here to support you with daily check-ins,\n peer connections, and uplifting messages. ",
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: AppColors.grey,
                fontSize: 20,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60),
            MyButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GetStarted()),
                );
              },
             
              text: " Let's get started",
              color: AppColors.black,
              bgcolor: AppColors.primary,
              fontsize: 20,
              fontweight: FontWeight.w400,
            ),
          ],
        ));
  }
}

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  String dropdownValue = 'Select your school';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.background,
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Image.asset('assets/images/onbtext.png', width: 375),
                const SizedBox(height: 24),
                Text(
                  "We only care about your well-being so there’s no need for a login, we respect your health and privacy. Just input your name and select your school ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    color: AppColors.grey,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 40),
                const MyTextField(
                  hintText: 'Your Name',
                ),
                const SizedBox(height: 10),
                Container(
                  width: 375,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.white,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Ionicons.chevron_down),
                    iconSize: 24,
                    elevation: 16,
                    style: GoogleFonts.outfit(
                      color: AppColors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    underline: Container(
                      height: 0,
                      color: AppColors.primary,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Select your school',
                      'University of Toronto',
                      'University of Waterloo',
                      'Ryerson university',
                      'York University',
                      'McMaster University',
                      'University of Ottawa',
                      'University of Guelph',
                      'Carleton University',
                      'Queen’s University',
                      'Western University',
                      'University of Windsor',
                      'Brock University',
                      'Trent University',
                      'Wilfrid Laurier University',
                      'University of Ontario Institute of Technology',
                      'Lakehead University',
                      'Nipissing University',
                      'Laurentian University',
                      'Algoma University',
                      'Royal Military College of Canada',
                      'OCAD University',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 40),
                MyButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckinScreenOne()),
                    );
                  },
                 
                  text: " Let's Continue",
                  color: AppColors.black,
                  bgcolor: AppColors.primary,
                  fontsize: 20,
                  fontweight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
