import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_buttons.dart';
import '../UI/question.dart';
import '../UI/right_wrong_overlay.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPagestate();
}

class QuizPagestate extends State<QuizPage>{
  @override
  Widget build(BuildContext context){ 
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => print("you answered true")),
            new QuestionText("pizza is nice", 1),
            new AnswerButton(false, () => print("you answered false")),
          ],
        ),
        new RightWrongOverlay(false)
      ],
    );
  }
}

