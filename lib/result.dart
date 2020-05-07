import 'package:flutter/material.dart';


class Result extends StatelessWidget {

  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    var resultText= 'You did it';
    if (resultScore<=20){
      resultText='You should kill yourself';

    }
    else if (resultScore>20){
      resultText='ok u get brownies';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(child:Column(children: <Widget>[
      
      
      
    Text(resultPhrase,
    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,
    color: Colors.black38),
    textAlign: TextAlign.center,
    ),
    FlatButton(child: Text('Reset'),onPressed: resetHandler,)
    ])
    );
  }
}