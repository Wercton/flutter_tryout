import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
          title: Text("KMI-Rechner"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: () {})
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_pin_rounded,
                  size: 128, color: Colors.deepPurple),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Gewicht (kg)",
                    labelStyle: TextStyle(color: Colors.deepPurpleAccent[200])),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.deepPurpleAccent[200], fontSize: 20),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Höhe (cm)",
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent[200]),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.deepPurpleAccent[200], fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    child: Text("Berechnung",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                    onPressed: () {},
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              Text("Über",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 22,
                  ))
            ],
          ),
        ));
  }
}
