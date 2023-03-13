import 'package:app_5/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'screens/contact_screen.dart';
import 'screens/exp_screen.dart';
import 'screens/main_screen.dart';
import 'screens/skill_sreen.dart';

class ResumeApp extends StatefulWidget {
  const ResumeApp({Key? key}) : super(key: key);

  @override
  State<ResumeApp> createState() => _ResumeAppState();
}

class _ResumeAppState extends State<ResumeApp> {
  int currentIndex = 0;
  final screen = [
    const MainScreen(),
    const ExperienceScreen(),
    const SkillScreen(),
    const ContactScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screen[currentIndex]),
      // backgroundColor: Colors.transparent.withOpacity(1.0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedItemColor: Colors.lightBlueAccent,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'ข้อมูล',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_sharp),
            label: 'ประสบการณ์',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.light_mode_outlined),
            label: 'ทักษะ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_cal_outlined),
            label: 'การติดต่อ',
          ),
        ],
      ),
      floatingActionButton: const Menu(),
    );
  }
}
