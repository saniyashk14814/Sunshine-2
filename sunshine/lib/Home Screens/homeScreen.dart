import 'package:sunshine/utils.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(24),
        child: Column(
          
        ),),
      ),      
    );
  }
}