// ignore: file_names

import 'package:sunshine/utils.dart';

import '../Home Screens/homeScreen.dart';

class CheckinScreenOne extends StatelessWidget {
  const CheckinScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> mood = [
      {'name': 'Happy', 'color': Colors.green},
      {'name': 'Sad', 'color': Color(0x70FCBD1B)},
      {'name': 'Angry', 'color': Color(0x70D22D2D)},
      {'name': 'Nervous', 'color': Color(0x70ED0CC9)},
      {'name': 'Great', 'color': Colors.lightBlue},
      {'name': 'Stressed', 'color': const Color(0x70991BFC)},
    ];
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.background,
          shape: BoxShape.rectangle,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const PageIndicator(
              pageno: 1,
            ),
            const SizedBox(height: 80),
            Image.asset('assets/images/lumen.png', height: 175, width: 175),
            const SizedBox(height: 40),
            Text(
              'Robert, tell me how you feel? ',
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  decoration: TextDecoration.none,
                  color: AppColors.black),
            ),
            const SizedBox(height: 2),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              // Define the variable 'mood' as an empty list
              itemCount: mood.length,
              itemBuilder: (BuildContext context, int index) {
                final color = mood[index]['color'];
                final moods = mood[index]['name'];
                return MoodCard(mood: moods, color: color);
              },
            ),
            const SizedBox(height: 30),
            MyButton(
              onPressed: () {},
              text: 'Skip',
              color: AppColors.black,
              bgcolor: AppColors.white,
              fontsize: 20,
              fontweight: FontWeight.normal,
              
            ),
            const SizedBox(height: 10),
            MyButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckinScreenTwo(),
                  ),
                );
              },
              text: "Let's Continue",
              color: AppColors.black,
              bgcolor: AppColors.primary,
              fontsize: 20,
              fontweight: FontWeight.normal,
             
            ),
          ],
        ));
  }
}

class CheckinScreenTwo extends StatelessWidget {
  const CheckinScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    List causes = [
      'School',
      'Work',
      'Family',
      'Friends',
      'Relationship',
      'Health',
      'Sleep',
      'Envy',
      'Anxiety',
      'Insomnia',
      'Loneliness',
      'Finances',
      'Grades',
      'Exams',
      'Homesickness',
      'Other',
    ];
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.background,
          shape: BoxShape.rectangle,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const PageIndicator(
              pageno: 2,
            ),
            const SizedBox(height: 50),
            Image.asset('assets/images/lumen.png', height: 175, width: 175),
            const SizedBox(height: 40),
            Text(
              'What is bothering you? ',
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  decoration: TextDecoration.none,
                  color: AppColors.black),
            ),
            const SizedBox(height: 2),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5 / 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: causes.length,
              itemBuilder: (BuildContext context, int index) {
                final cause = causes[index];
                return CauseCard(cause: cause);
              },
            ),
            const SizedBox(height: 30),
            MyButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckinScreenOne(),
                  ),
                );
              },
              text: 'Back',
              color: AppColors.black,
              bgcolor: AppColors.white,
              fontsize: 20,
              fontweight: FontWeight.normal,
              
            ),
            const SizedBox(height: 10),
            MyButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckinScreenThree(),
                  ),
                );
              },
              text: "Let's Continue",
              color: AppColors.black,
              bgcolor: AppColors.primary,
              fontsize: 20,
              fontweight: FontWeight.normal,
            
            ),
          ],
        ));
  }
}

class CheckinScreenThree extends StatelessWidget {
  const CheckinScreenThree({super.key});

  set _content(String _content) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.background,
        shape: BoxShape.rectangle,
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const PageIndicator(
            pageno: 3,
          ),
          const SizedBox(height: 50),
          Image.asset('assets/images/lumen.png', height: 175, width: 175),
          const SizedBox(height: 40),
          Text(
            'Any other thing you want to\n tell me Robert? ',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.w500,
                fontSize: 28,
                decoration: TextDecoration.none,
                color: AppColors.black),
          ),
          const SizedBox(height: 2),
          TextField(
            maxLines: 8,
            maxLength: 300,
           
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.white,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
              ),
              hintText: 'Talk to me...',
              hintStyle: GoogleFonts.outfit(
                color: AppColors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
              contentPadding: const EdgeInsets.all(18),
            ),
          ),
          const SizedBox(height: 30),
          MyButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckinScreenTwo(),
                ),
              );
            },
            text: 'Back',
            color: AppColors.black,
            bgcolor: AppColors.white,
            fontsize: 20,
            fontweight: FontWeight.normal,
           
          ),
          const SizedBox(height: 10),
          MyButton(
            onPressed: () async {
               SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('onboardingCompleted', true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            },
            text: "Let's Continue",
            color: AppColors.black,
            bgcolor: AppColors.primary,
            fontsize: 20,
            fontweight: FontWeight.normal,
           
          ),
        ],
      ),
    );
  }
}
