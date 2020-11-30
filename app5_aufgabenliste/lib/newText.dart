import 'package:flutter/material.dart';

class newText extends StatefulWidget {
  @override
  _newTextState createState() => _newTextState();
}

class _newTextState extends State<newText> {
  List<bool> _selectionsStyle = List.generate(3, (_) => false);
  List<bool> _selectionsAlign = [true, false, false];

  final Color iconsFormat = Colors.white;
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
                  iconSize: 40,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.deepOrange,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  flex: 4,
                  child: Container(),
                ),
                ToggleButtons(
                  children: [
                    Icon(
                      Icons.format_bold_rounded,
                      color: iconsFormat,
                    ),
                    Icon(
                      Icons.format_italic_rounded,
                      color: iconsFormat,
                    ),
                    Icon(
                      Icons.format_underline_rounded,
                      color: iconsFormat,
                    ),
                  ],
                  isSelected: _selectionsStyle,
                  onPressed: (int index) {
                    setState(
                      () {
                        _selectionsStyle[index] = !_selectionsStyle[index];
                      },
                    );
                  },
                  fillColor: Colors.deepOrange,
                  renderBorder: true,
                  borderRadius: BorderRadius.circular(5),
                  borderColor: Colors.deepOrange,
                  selectedBorderColor: Colors.deepOrange,
                  splashColor: Colors.deepOrangeAccent,
                  highlightColor: Colors.deepOrangeAccent,
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                ToggleButtons(
                  children: [
                    Icon(
                      Icons.format_align_left_rounded,
                      color: iconsFormat,
                    ),
                    Icon(
                      Icons.format_align_center_rounded,
                      color: iconsFormat,
                    ),
                    Icon(
                      Icons.format_align_right_rounded,
                      color: iconsFormat,
                    ),
                  ],
                  isSelected: _selectionsAlign,
                  onPressed: (int index) {
                    setState(
                      () {
                        if (_selectionsAlign[index]) {
                        } else if (index == 0) {
                          _selectionsAlign = [true, false, false];
                        } else if (index == 1) {
                          _selectionsAlign = [false, true, false];
                        } else if (index == 2) {
                          _selectionsAlign = [false, false, true];
                        }
                      },
                    );
                  },
                  fillColor: Colors.deepOrange,
                  renderBorder: true,
                  borderRadius: BorderRadius.circular(5),
                  borderColor: Colors.deepOrange,
                  selectedBorderColor: Colors.deepOrange,
                  splashColor: Colors.deepOrangeAccent,
                  highlightColor: Colors.deepOrangeAccent,
                )
              ],
            ),
            Expanded(
              child: Container(),
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
                      color: Colors.transparent,
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
                  borderRadius: BorderRadius.circular(5),
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
                        color: Colors.transparent,
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
