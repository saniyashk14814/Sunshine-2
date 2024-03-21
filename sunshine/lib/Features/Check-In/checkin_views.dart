import 'package:flutter/material.dart';
import 'package:sunshine/Core/username_generator.dart';
import 'package:sunshine/Core/utils.dart';
import 'package:sunshine/Core/widgets.dart';
import 'package:sunshine/Features/Home/home_screen.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.currentPage});
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 5,
            width: MediaQuery.of(context).size.width / 3.9,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: currentPage == index
                  ? AppColors.primaryDark
                  : const Color(0x51899199),
            ),
          );
        }),
      ),
    );
  }
}

class CheckInScreenOne extends StatefulWidget {
  const CheckInScreenOne({super.key});

  @override
  State<CheckInScreenOne> createState() => _CheckInScreenOneState();
}

class _CheckInScreenOneState extends State<CheckInScreenOne> {
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

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> mood = [
      {
        'name': 'Angry',
        'bg-color': const Color(0x6FD22D2D),
        'image': 'assets/images/mood/angry.png',
        'color': const Color(0xFFD22D2D),
      },
      {
        'name': 'Stressed',
        'bg-color': const Color(0x70991BFC),
        'image': 'assets/images/mood/nervous.png',
        'color': const Color(0xFF991BFC),
      },
      {
        'name': 'Nervous',
        'bg-color': const Color(0x70ED0CC9),
        'image': 'assets/images/mood/stressed.png',
        'color': const Color(0xFFED0CC9),
      },
      {
        'name': 'Sad',
        'bg-color': const Color(0x70FCBD1B),
        'image': 'assets/images/mood/sad.png',
        'color': const Color(0xFFEDAE0C),
      },
      {
        'name': 'Happy',
        'bg-color': const Color(0x700099EF),
        'image': 'assets/images/mood/happy.png',
        'color': const Color(0xFF0099EF),
      },
      {
        'name': 'Excited',
        'bg-color': const Color(0x7013EF00),
        'image': 'assets/images/mood/excited.png',
        'color': const Color(0xFF0A8300),
      },
    ];
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.background,
        shape: BoxShape.rectangle,
      ),
      child: FadeInUp(
        animate: true,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const PageIndicator(currentPage: 0),
            const SizedBox(height: 70),
            Image.asset('assets/images/lumen.png', height: 150),
            const SizedBox(height: 30),
            const TextWidget(
                text: 'How are you feeling today?',
                fontSize: 23,
                fontWeight: FontWeight.w500),
            GridView.builder(
              shrinkWrap: true,
              itemCount: mood.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: mood[index]['bg-color'],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        mood[index]['image'],
                        height: 60,
                        width: 50,
                      ),
                      const SizedBox(height: 10),
                      TextWidget(
                        text: mood[index]['name'],
                        color: mood[index]['color'],
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ButtonWidget(
              text: "Skip",
              onPressed: () {},
              bordercolor: const Color(0xFFC0D8F2),
              color: AppColors.lightGrey,
            ),
            const SizedBox(height: 10),
            ButtonWidget(
              text: "Next",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckInScreenTwo(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CheckInScreenTwo extends StatefulWidget {
  const CheckInScreenTwo({super.key});

  @override
  State<CheckInScreenTwo> createState() => _CheckInScreenTwoState();
}

class _CheckInScreenTwoState extends State<CheckInScreenTwo> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    List causes = [
      'School',
      'Work',
      'Family',
      'Friends',
      'Relationships',
      'Health',
      'Finances',
      'Grades',
      'Other',
    ];
    return FadeIn(
      animate: true,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.background,
          shape: BoxShape.rectangle,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const PageIndicator(currentPage: 1),
            const SizedBox(height: 40),
            Image.asset('assets/images/lumen.png', height: 150),
            const SizedBox(height: 30),
            const TextWidget(
                text: 'What is causing your mood?',
                fontSize: 23,
                fontWeight: FontWeight.w500),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : const Color(0xFFF8ECC3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFE2D8B6),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: causes[index],
                        color: isSelected
                            ? AppColors.white
                            : AppColors.primaryDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            ButtonWidget(
              text: "Back",
              onPressed: () {
                Navigator.pop(context);
              },
              bordercolor: const Color(0xFFC0D8F2),
              color: AppColors.lightGrey,
            ),
            const SizedBox(height: 5),
            ButtonWidget(
              text: "Next",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckInScreenThree(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CheckInScreenThree extends StatelessWidget {
  const CheckInScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.rectangle,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const PageIndicator(currentPage: 2),
              const SizedBox(height: 40),
              Image.asset('assets/images/lumen.png', height: 150),
              const SizedBox(height: 30),
              const TextWidget(
                  text: 'Any other thing you want to tell me?',
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
              const SizedBox(height: 20),
              TextField(
                maxLines: 10,
                style: GoogleFonts.outfit(
                  color: AppColors.primaryDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
                maxLength: 450,
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              ButtonWidget(
                text: "Let's Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
