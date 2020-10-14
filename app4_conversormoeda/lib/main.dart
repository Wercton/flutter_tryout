import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request =
    "https://api.hgbrasil.com/finance?format=json-cors&key=90d9f0ce";

void main() async {
  runApp(MaterialApp(
    home: Home(),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("\$ Conversor de Moeda \$",
            style: TextStyle(color: Colors.lightGreen)),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          IconButton(
            color: Colors.lightGreen,
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
