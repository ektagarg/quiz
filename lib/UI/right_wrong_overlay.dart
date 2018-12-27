import 'package:flutter/material.dart';

class RightWrongOverlay extends StatefulWidget{

  final bool _isCorrect;

  RightWrongOverlay(this._isCorrect);
  @override
  State createState() => new RightWrongOverlayState();
}

class RightWrongOverlayState extends State<RightWrongOverlay> {
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => print("You tapped the overlay"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: new Icon(widget._isCorrect==true ? Icons.done : Icons.clear, size: 80.0,),
            ),
            new Text(widget._isCorrect == true ? "Correct!" : "Wrong!", style: new TextStyle(color: Colors.white, fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}