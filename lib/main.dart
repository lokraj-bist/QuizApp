import 'package:flutter/material.dart';
import 'package:quiz_app_complete/splash.dart';
import 'quiz_screen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Splash(),
    );
  }
}
