import 'package:app_5/resume_app/resume_main.dart';
import 'package:app_5/screens/home.dart';
import 'package:flutter/material.dart';
import 'calcualte_app/calculate_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App_5',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Sukhumvit',
            ),
      ),
      home: const Home(),
      routes: {
        '/home': (context) => const Home(),
        '/resume_app': (context) => const ResumeApp(),
        '/calculate_app': (context) => const CalculateApp(),
      },
    );
  }
}
