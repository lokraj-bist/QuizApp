import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  const ResultScreen({
    Key? key,
    required this.totalScore,
    required this.resetQuiz,
  }) : super(key: key);

  String get resultText {
    if (totalScore >= 8) {
      return 'You are a genius';
    } else if (totalScore >= 4) {
      return 'You did great!';
    } else {
      return 'Better luck next time!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultText,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetQuiz,
            child: const Text(
              'Restart Quiz',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
