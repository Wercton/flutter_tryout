import 'package:Aufgabenliste/newText.dart';
import 'package:flutter/material.dart';

class Textos extends StatefulWidget {
  @override
  _TextosState createState() => _TextosState();
}

class _TextosState extends State<Textos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.list_alt_outlined,
                      color: Colors.deepOrange,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.fact_check_outlined,
                      color: Colors.deepOrange,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => newText()),
          );
        },
      ),
    );
  }
}
