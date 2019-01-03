import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_buttons.dart';
import '../UI/question.dart';
import '../UI/right_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPagestate();
}

class QuizPagestate extends State<QuizPage>{
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Is the universe expanding?", true),
    new Question("Is Bill Gates the richest person in the world?", false),
    new Question("Is Dow Jones an indian stock exchange?", false),
    new Question("Is Malala Yousafzai the Youngest Peace Prize Laureate till date?", true),
    new Question("Fishes do not have eyelids, except sharks. Right?", true),
    new Question("Is Java script Single threaded?", true),
    new Question("DAENERYS TARGARYEN originally had blue eyes?", false),
    new Question("Is Scarlett Johansson first wife of Ryan Reynolds?", true),
    new Question("Sri Lanka has a sole Test win against the Aussies till date?", true),
    new Question("Venus planet has a very strong Magnetic field?", false),
    new Question("Is Meghan Markle's first name Rachel?", true),
    new Question("In 100 billion years our Sun will become a planetary nebula?", false)
  ]);
  String questionText;
  int questionNum;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

@override
void initState() { 
  super.initState();
  currentQuestion = quiz.nextQues;
  questionText = currentQuestion.question;
  questionNum = quiz.quesNumber;
}

void handleAnswer(answer){
  isCorrect = (currentQuestion.answer == answer);
  quiz.answer(isCorrect);
  this.setState(() {
    overlayShouldBeVisible = true;
  });
}

  @override
  Widget build(BuildContext context){ 
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNum),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayShouldBeVisible == true ? new RightWrongOverlay(
          isCorrect,
          () {
            if(quiz.length == questionNum){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextQues;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNum = quiz.quesNumber;
            });
          }
          ) : new Container()
      ],
    );
  }
}

