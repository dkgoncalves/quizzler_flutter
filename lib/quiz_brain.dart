import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Icon> _answers = [];

  List<Question> _questions = [
    Question(a: 'You can lead a cow down stairs but not up stairs.', b: false),
    Question(a: 'Approximately one quarter of human bones are in the feet.', b: true),
    Question(a: 'A slug\'s blood is green.', b: true),
    Question(a: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', b: true),
    Question(a: 'It is illegal to pee in the Ocean in Portugal.', b: true),
    Question(a: 'No piece of square dry paper can be folded in half more than 7 times.', b: false),
    Question(
      a: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      b: true
    ),
    Question(a: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', b: false),
    Question(a: 'The total surface area of two human lungs is approximately 70 square metres.', b: true),
    Question(a: 'Google was originally called \"Backrub\".', b: true),
    Question(a: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', b: true),
    Question(a: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', b: true),
  ];

  void clear() {
    _questionNumber = 0;
    _answers = [];
  }

  void getNextQuestion() {
    if (_questionNumber < _questions.length -1) {
     _questionNumber++;
    }
  }

  void getResponses(bool pickedAnswer) {
    if (_answers.length < _questions.length) {
     if (pickedAnswer == getQuestionAnswer()) {
        _answers.add( Icon(Icons.check, color: Colors.green, semanticLabel: 'true'));
      } else {
        _answers.add( Icon(Icons.close, color: Colors.red, semanticLabel: 'false'));
      }
    }
  }

  bool finished(){
    return _answers.length == _questions.length;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  List<Icon> responses(){
    return _answers;
  }

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  int getQuestionRights(){
   var a = _answers.where((e) => e.semanticLabel == 'true');
   return a.length;
  }

}