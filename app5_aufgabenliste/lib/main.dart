import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _toDoController = TextEditingController();

  List _toDoList = [];

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["title"] = _toDoController.text;
      _toDoController.text = "";
      newToDo["ok"] = false;
      _toDoList.add(newToDo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.list_alt_outlined,
              color: Colors.deepOrange,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.fact_check_outlined,
              color: Colors.deepOrange,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.list_alt_outlined,
              color: Colors.transparent,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.list_alt_outlined,
              color: Colors.transparent,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.list_alt_outlined,
              color: Colors.transparent,
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(17, 1, 17, 1),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _toDoController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.deepOrange,
                    decoration: InputDecoration(
                      hintText: "Enter new task",
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.deepOrange,
                  child: Text("ADD",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  onPressed: _addToDo,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: _toDoList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ClipPath(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                      ),
                      child: CheckboxListTile(
                        title: Text(
                          _toDoList[index]["title"],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        value: _toDoList[index]["ok"],
                        secondary: CircleAvatar(
                          radius: 0,
                          backgroundColor: Colors.deepOrange,
                          child: Icon(
                            _toDoList[index]["ok"]
                                ? Icons.check
                                : Icons.error_outline,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/aufgaben.json");
  }

  Future<File> _savedData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _realData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
