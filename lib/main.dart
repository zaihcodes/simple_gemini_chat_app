import 'package:flutter/material.dart';
import 'package:gemini_gpt/app_theme.dart';
import 'package:gemini_gpt/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkMode,
      home: const OnBoardingScreen(),
    );
  }
}
