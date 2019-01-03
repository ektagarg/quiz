import 'package:flutter/material.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget{
  final int _score;
  final int _totalQues;

  ScorePage(this._score, this._totalQues);

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your score:", style: new TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold)),
          new Text(_score.toString() + "/" + _totalQues.toString(), style: new TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold)),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null),
          )
        ],
      ),
    );
  }
}