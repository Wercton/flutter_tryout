import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
      bottomAppBarColor: Colors.black,
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _toDoController = TextEditingController();
  Color branco = Colors.white;

  List _toDoList = [];

  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;

  @override
  void initState() {
    super.initState();

    _readData().then(
      (data) {
        setState(
          () {
            _toDoList = json.decode(data);
          },
        );
      },
    );
  }

  void _addToDo() {
    setState(
      () {
        Map<String, dynamic> newToDo = Map();
        if (_toDoController.text != "") {
          newToDo["title"] = _toDoController.text;
          _toDoController.text = "";
          newToDo["ok"] = false;
          _toDoList.insert(0, newToDo);
          _saveData();
        }
      },
    );
  }

  Future<Null> _refreshing() async {
    await Future.delayed(Duration(seconds: 1));

    setState(
      () {
        _toDoList.sort(
          (a, b) {
            if (a["ok"] && !b["ok"])
              return 1;
            else if (!a["ok"] && b["ok"])
              return -1;
            else
              return 0;
          },
        );
      },
    );
    _saveData();
    return null;
  }

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
                    onPressed: () {},
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
              child: RefreshIndicator(
                backgroundColor: Colors.deepOrange,
                onRefresh: _refreshing,
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: _toDoList.length,
                  itemBuilder: buildItem,
                ),
              ),
            )
          ],
        ),
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

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        alignment: Alignment(-0.9, 0),
        color: Colors.deepOrange,
        child: Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(30),
          ),
          child: CheckboxListTile(
            activeColor: Colors.deepOrange,
            checkColor: Colors.black,
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
                _toDoList[index]["ok"] ? Icons.check : Icons.error_outline,
                color: Colors.deepOrange,
              ),
            ),
            onChanged: (c) {
              setState(
                () {
                  _toDoList[index]["ok"] = c;
                  _saveData();
                },
              );
            },
          ),
        ),
      ),
      onDismissed: (direction) {
        setState(
          () {
            _lastRemoved = Map.from(_toDoList[index]);
            _lastRemovedPos = index;
            _toDoList.removeAt(index);

            _saveData();

            final snackbar = SnackBar(
              backgroundColor: Colors.deepOrange,
              content: Text(
                "Aufgaben \"${_lastRemoved["title"]}\" gelöscht!",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              action: SnackBarAction(
                textColor: Colors.black,
                label: "undo",
                onPressed: () {
                  setState(() {
                    _toDoList.insert(_lastRemovedPos, _lastRemoved);
                    _saveData();
                  });
                },
              ),
              duration: Duration(seconds: 4),
            );
            Scaffold.of(context)
                .removeCurrentSnackBar(); //evita empilhamento das snackbars
            Scaffold.of(context).showSnackBar(snackbar);
          },
        );
      },
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/aufgaben.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
