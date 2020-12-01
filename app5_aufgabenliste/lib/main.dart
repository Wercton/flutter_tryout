import 'package:flutter/material.dart';
import 'package:Aufgabenliste/tasks.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
      bottomAppBarColor: Colors.black,
    ),
  ));
}
