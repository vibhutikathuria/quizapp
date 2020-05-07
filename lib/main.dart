import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _questions = const [
      {'questionText': 'Who\'s your favourite singer?',
      'answers': [{'text':'Freddie Mercury', 'score': 10}, {'text':'John Denver', 'score': 8}, {'text':'The weeknd', 'score':0}, {'text':'Billie Eilish','score': -10}],},
      {'questionText': 'What\'s your favourite band', 
      'answers': [{'text':'Queen', 'score':10}, {'text':'Pink Floyd', 'score': 7}, {'text':'Arctic Monkeys', 'score': 0}, {'text': 'one direction', 'score': -10}],},
      {'questionText': 'Do you do drugs?', 
      'answers': [{'text': 'Yes', 'score': 10}, {'text': 'No', 'score':-10 }],},
      {'questionText' : 'Do you pour milk on cereal or cereal on milk', 'answers':[{'text': 'milk on cereal', 'score':10},{'text': 'cereal on milk', 'score': 0}]}
    ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
    _totalScore = 0;
    });
    
  }

  void _answerQuestion(int score){
    _totalScore+= score;
  
    setState(() {
      _questionIndex = _questionIndex+1;
    });
    
    print(_questionIndex);
    if (_questionIndex < _questions.length){
      print('we have more questions');
    }
    else {
      print('no more questions');
        }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
          ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions,)
        
        
        
        : Result(_totalScore, _resetQuiz),
    ));
  }
}
