import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(
      Quiz(),
    );

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //tells it to look inside quizBrain > questionBank> questionNumber> questionText
                quizBrain.questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text('True'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
                onSurface: Colors.grey,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                bool correctAnswer =
                    quizBrain.questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  print('User got it right');
                } else {
                  print('User got it wrong');
                }
                setState(() {
                  scoreKeeper.add(
                    Icon(Icons.check, color: Colors.green),
                  );
                  questionNumber = questionNumber + 1;
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text('False'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
                onSurface: Colors.grey,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                bool correctAnswer =
                    quizBrain.questionBank[questionNumber].questionAnswer;
                if (correctAnswer == false) {
                  print('User got it right');
                } else {
                  print('User got it wrong');
                }
                setState(() {
                  scoreKeeper.add(
                    Icon(Icons.close, color: Colors.red),
                  );
                  questionNumber = questionNumber + 1;
                });

                //The user picked true.
              },
            ),
          ),
        ),

        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
