import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Zahler',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _orcs = 0;
  String _infoText = 'Willkommen!';

  void _changeorcs(int delta){
    setState(() {
      _orcs += delta;

      if(_orcs < 0){
        _infoText = "... wtf";
      }else if(_orcs > 10){
        _infoText = "Wir haben einen Betrüger!";
      }else{
        _infoText = "Willkommen!";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/mordor.jpeg",
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Text(
                _infoText,
                style: TextStyle(color: Colors.deepOrange[400],
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
              ), 
            ),
            Text(
              'Orcs: $_orcs',
              style: TextStyle(color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 60),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text('+1', style: TextStyle(color: Colors.white, fontSize: 40)),
                    onPressed: () {
                      _changeorcs(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text('-1', style: TextStyle(color: Colors.white, fontSize: 40)),
                    onPressed: () {
                      _changeorcs(-1);
                    },
                  )
                ),
              ],
            ),
          ],
        )
    ],);
  }
}
