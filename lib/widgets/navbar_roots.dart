import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymedic/screens/home_screen.dart';
import 'package:mymedic/screens/messages_screen.dart';
import 'package:mymedic/screens/diagnosis_screen.dart';
import 'package:mymedic/screens/schedule_screen.dart';
import 'package:mymedic/screens/settings_screen.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    HomeScreen(),
    MessagesScreen(),
    DiagnosisScreen(),
    ScheduleScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCDE0C9),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Color(0xFFE8ECDE),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF266975),
          unselectedItemColor: Colors.black38,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                ),
                label: "Messages"),
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_services_outlined), label: "AI Scan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: "Schedule"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
