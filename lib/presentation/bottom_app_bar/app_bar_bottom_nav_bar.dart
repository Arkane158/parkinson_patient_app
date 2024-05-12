import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/doctors/doctors_screen.dart';
import 'package:parkinson_app/presentation/home/home_screen.dart';
import 'package:parkinson_app/presentation/profile/profile_screen.dart';
import 'package:parkinson_app/presentation/services/services_screen.dart';

class AppBarAndBottomNav extends StatefulWidget {
  const AppBarAndBottomNav({super.key});
  static const String screenName = "doctorHomeScreen";

  @override
  State<AppBarAndBottomNav> createState() => _AppBarAndBottomNavState();
}

class _AppBarAndBottomNavState extends State<AppBarAndBottomNav> {
  int currentIndex = 0;
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: currentIndex == 0
            ? const Size.fromHeight(20.0)
            : const Size.fromHeight(
                60.0), // Adjust the preferred size based on currentIndex
        child: AppBar(
          elevation: 0,
          title: Text(_title),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (selectedIndex) {
          setState(() {
            switch (selectedIndex) {
              case 0:
                _title = '';
                break;
              case 1:
                _title = 'Services';
                break;
              case 2:
                _title = 'Doctors';
                break;
              case 3:
                _title = 'Profile';
                break;
              default:
                _title = 'Home';
                break;
            }

            currentIndex = selectedIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/services.png')),
              label: 'Services'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/doctors.png')),
              label: 'Doctors'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp), label: 'Profile'),
        ],
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [
    const HomeScreen(),
    const ServicesScreen(),
    const DoctorsScreen(),
    const ProfileScreen(),
  ];
}
