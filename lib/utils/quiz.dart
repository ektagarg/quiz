import './question.dart';

class Quiz{
  List <Question> _questions;
  int _curQuesIndex = -1;
  int _score = 0;

  Quiz(this._questions){
    _questions.shuffle();
  }

  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get quesNumber => _curQuesIndex+1;
  int get score => _score;

  Question get nextQues{
    _curQuesIndex++;
    if(_curQuesIndex >= length)
      return null;
    return _questions[_curQuesIndex];
  }

  void answer(bool isCorrect){
    if(isCorrect)
      _score++;
  }
}
