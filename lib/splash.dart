import 'package:flutter/material.dart';
import 'quiz_screen.dart';
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuizScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFF252c4a),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.question_answer_outlined,
              color: Colors.white,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Lets Go',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
