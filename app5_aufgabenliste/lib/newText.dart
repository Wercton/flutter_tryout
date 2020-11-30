import 'package:flutter/material.dart';

class newText extends StatefulWidget {
  @override
  _newTextState createState() => _newTextState();
}

class _newTextState extends State<newText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  iconSize: 50,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.deepOrange,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                cursorColor: Colors.deepOrange,
                cursorHeight: 40,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                height: 600,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepOrange,
                  ),
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.deepOrange,
                  cursorHeight: 30,
                  decoration: InputDecoration(
                    hintText: "text goes here",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
