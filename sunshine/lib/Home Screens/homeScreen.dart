import 'package:sunshine/Check-in%20Screens/checkin%20screen.dart';
import 'package:sunshine/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get count => 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Robert",
                        style: GoogleFonts.outfit(
                          color: AppColors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      Text(
                        'Welcome to your safe space',
                        style: GoogleFonts.outfit(
                          color: AppColors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Image.asset('assets/images/lumen.png',
                          height: 50, width: 40),
                      Text(
                        ' ${count}',
                        style: GoogleFonts.outfit(
                          color: AppColors.grey,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: AppColors.grey,
                thickness: 0.2,
              ),
              Text('Mood History', style: GoogleFonts.outfit(fontSize: 20)),
              const SizedBox(height: 5),
              Image.asset('assets/images/emotion-group.png'),
              const SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckinScreenOne(),
                      ),
                    );
                  },
                  child: Image.asset('assets/images/checkin-card.png')),
              const SizedBox(height: 12),
              Image.asset('assets/images/sunshine-q-uite.png'),
              const SizedBox(height: 12),
              Image.asset('assets/images/ai-card.png'),
              const SizedBox(height: 12),
              Image.asset('assets/images/therapy-card.png'),
            ],
          ),
        ),
      ),
    );
  }
}
