import 'package:flutter/material.dart';
import 'quiz_logic.dart';
import 'quiz_result.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizLogic quizLogic = QuizLogic();

  void handleAnswer(int score) {
    setState(() {
      quizLogic.answerQuestion(score);
    });
  }

  void resetQuiz() {
    setState(() {
      quizLogic.resetQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252c4a),
      appBar: AppBar(
        title:  Text(
          'Quiz App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF252c4a),
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: quizLogic.nextQuestion()
            ? Column(crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Question ${quizLogic.currentQuestion + 1}/${quizLogic.questions.length}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  SizedBox(height: 70,),
                  Text(
                    quizLogic.questions[quizLogic.currentQuestion]['question']
                        as String,
                    style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(height: 20),
                  ...(quizLogic.questions[quizLogic.currentQuestion]['answers']
                          as List<Map<String, Object>>)
                      .asMap()
                      .map((index, answer) {
                        final frontText = ['A', 'B', 'C', 'D'];

                        return MapEntry(
                          index,
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side: BorderSide(
                                color: Colors.blue,
                              ),
                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(10)
                              )

                            ),
                            onPressed: () =>
                                handleAnswer(answer['score'] as int),
                            child: Row(
                              children: [
                                Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                    child: Center(
                                        child: Text(
                                      '${frontText[index]}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text('${answer['option']}',style: TextStyle(color: Colors.white),),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                      .values
                      .toList(),
                ],
              )
            : ResultScreen(
                totalScore: quizLogic.finalScore,
                resetQuiz: resetQuiz,
              ),
      ),
    );
  }
}
