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
  TextEditingController gewichtController = TextEditingController();
  TextEditingController hoheController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Gib Ihre Daten ein";

  void _resetFields() {
    gewichtController.text = "";
    hoheController.text = "";
    setState(() {
      _infoText = "Gib Ihre Daten ein";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _berechnung() {
    double gewicht = double.parse(gewichtController.text);
    double hohe = double.parse(hoheController.text) / 100;
    double kmi = gewicht / (hohe * hohe);

    setState(() {
      if (kmi < 10.0) {
        _infoText = "Unmöglich (KMI: ${kmi.toStringAsPrecision(1)})";
      } else if (kmi < 18.5) {
        _infoText = "Untergewicht (KMI: ${kmi.toStringAsPrecision(2)})";
      } else if (kmi <= 25) {
        _infoText = "Normalgewicht (KMI: ${kmi.toStringAsPrecision(2)})";
      } else if (kmi <= 30) {
        _infoText = "Übergewicht (KMI: ${kmi.toStringAsPrecision(2)})";
      } else if (kmi <= 35) {
        _infoText = "Adipositas I (KMI: ${kmi.toStringAsPrecision(2)})";
      } else if (kmi <= 40) {
        _infoText = "Adipositas II (KMI: ${kmi.toStringAsPrecision(2)})";
      } else {
        _infoText = "Adipositas III (KMI: ${kmi.toStringAsPrecision(2)})";
      }
    });
  }

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
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Icon(Icons.person_pin_rounded,
                      size: 128, color: Colors.deepPurple),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Gewicht (kg)",
                      labelStyle:
                          TextStyle(color: Colors.deepPurpleAccent[200])),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.deepPurpleAccent[200], fontSize: 20),
                  controller: gewichtController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Bitte, schreiben Sie Ihre Gewicht.";
                    }
                  },
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Höhe (cm)",
                      labelStyle:
                          TextStyle(color: Colors.deepPurpleAccent[200]),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.deepPurpleAccent[200], fontSize: 20),
                    controller: hoheController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Bitte, schreiben Sie Ihre Höhe.";
                      }
                    }),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      child: Text("Berechnung",
                          style: TextStyle(color: Colors.white, fontSize: 22)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _berechnung();
                        }
                      },
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
                Text(_infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 22,
                    ))
              ],
            ),
          ),
        ));
  }
}
