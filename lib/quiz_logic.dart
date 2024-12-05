class QuizLogic {
  int currentQuestion = 0;
  int finalScore = 0;

  final List<Map<String, Object>> questions = [
    {
      'question': 'What is the best way to start your day?',
      'answers': [
        {'option': 'Energized', 'score': 4},
        {'option': 'Rushed', 'score': 3},
        {'option': 'Late', 'score': 2},
        {'option': 'Lazy', 'score': 1},
      ],
    },
    {
      'question': 'What is the best way to end your day?',
      'answers': [
        {'option': 'Relaxing', 'score': 4},
        {'option': 'Stressed', 'score': 3},
        {'option': 'Exhausted', 'score': 2},
        {'option': 'Neutral', 'score': 1},
      ],
    },

    {
      'question': 'What is the best way to end your day?',
      'answers': [
        {'option': 'Relaxing', 'score': 4},
        {'option': 'Stressed', 'score': 3},
        {'option': 'Exhausted', 'score': 2},
        {'option': 'Neutral', 'score': 1},
      ],
    },
  ];

  bool nextQuestion() => currentQuestion < questions.length;

  void answerQuestion(int score) {
    finalScore += score;
    currentQuestion++;
  }

  void resetQuiz() {
    currentQuestion = 0;
    finalScore = 0;
  }
}
