import 'package:sunshine/utils.dart';

import 'homeScreen.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State {
  int _selectedTab = 0;

  List _pages = [
    const HomeScreen(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          backgroundColor: Colors.white,
          
          selectedItemColor: AppColors.black,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          elevation: 0,
          unselectedLabelStyle: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: _selectedTab == 0
                  ? const Icon(Ionicons.home)
                  : const Icon(Ionicons.home_outline),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: _selectedTab == 1
                  ? const Icon(Ionicons.star)
                  : const Icon(Ionicons.star_outline),
              label: "Lumen.ai",
            ),
            BottomNavigationBarItem(
              icon: _selectedTab == 2
                  ? const Icon(Ionicons.book)
                  : const Icon(Ionicons.book_outline),
              label: "Log",
            ),
            BottomNavigationBarItem(
              icon: _selectedTab == 3
                  ? const Icon(Ionicons.compass)
                  : const Icon(Ionicons.compass_outline),
              label: "Explore",
            ),
          ],
        ),
      ),
    );
  }
}
