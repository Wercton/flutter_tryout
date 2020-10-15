import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request =
    "https://api.hgbrasil.com/finance?format=json-cors&key=90d9f0ce";

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      hintColor: Colors.white,
      primaryColor: Colors.white,
    ),
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
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final bitcoinController = TextEditingController();
  final libraController = TextEditingController();
  final pesoArgentinoController = TextEditingController();

  double dolar;
  double euro;
  double bitcoin;
  double libra;
  double pesoArgentino;

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
    bitcoinController.text = "";
    libraController.text = "";
    pesoArgentinoController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(2);
    libraController.text = (real / libra).toStringAsFixed(2);
    pesoArgentinoController.text = (real / pesoArgentino).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    double real = this.dolar * dolar;
    realController.text = (real).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(2);
    libraController.text = (real / libra).toStringAsFixed(2);
    pesoArgentinoController.text = (real / pesoArgentino).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    double real = this.euro * euro;
    realController.text = (real).toStringAsFixed(2);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(2);
    libraController.text = (real / libra).toStringAsFixed(2);
    pesoArgentinoController.text = (real / pesoArgentino).toStringAsFixed(2);
  }

  void _bitcoinChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double bitcoin = double.parse(text);
    double real = this.bitcoin * bitcoin;
    realController.text = (real).toStringAsFixed(2);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    libraController.text = (real / libra).toStringAsFixed(2);
    pesoArgentinoController.text = (real / pesoArgentino).toStringAsFixed(2);
  }

  void _libraChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double libra = double.parse(text);
    double real = this.libra * libra;
    realController.text = (real).toStringAsFixed(2);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(2);
    pesoArgentinoController.text = (real / pesoArgentino).toStringAsFixed(2);
  }

  void _pesoArgentinoChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double pesoArgentino = double.parse(text);
    double real = this.pesoArgentino * pesoArgentino;
    realController.text = (real).toStringAsFixed(2);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(2);
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("\$ Conversor de Moeda \$",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.refresh),
            onPressed: () {
              _clearAll();
            },
          )
        ],
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          /*snapshot é uma cópia/fotografia momentânea dos dados obtidos*/
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: Text("Carregando dados...",
                      style: TextStyle(color: Colors.white, fontSize: 25.0)));
            default:
              if (snapshot.hasError) {
                child:
                Text("Dados não encontrados.",
                    style: TextStyle(color: Colors.white, fontSize: 25.0));
              } else {
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                bitcoin = snapshot.data["results"]["currencies"]["BTC"]["buy"];
                libra = snapshot.data["results"]["currencies"]["GBP"]["buy"];
                pesoArgentino =
                    snapshot.data["results"]["currencies"]["ARS"]["buy"];
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: Icon(
                              Icons.attach_money_rounded,
                              color: Colors.amber,
                              size: 128,
                            ),
                          ),
                          buildTextField(
                              "Reais", "R\$ ", realController, _realChanged),
                          Divider(),
                          buildTextField("Dólares", "US\$ ", dolarController,
                              _dolarChanged),
                          Divider(),
                          buildTextField(
                              "Euros", "€ ", euroController, _euroChanged),
                          Divider(),
                          buildTextField("Bitcoin", "\₿ ", bitcoinController,
                              _bitcoinChanged),
                          Divider(),
                          buildTextField("Libra esterlina", "£ ",
                              libraController, _libraChanged),
                          Divider(),
                          buildTextField("Peso argentino", "\$ ",
                              pesoArgentinoController, _pesoArgentinoChanged)
                        ]),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Widget buildTextField(
    String moeda, String simbolo, TextEditingController c, Function f) {
  return TextFormField(
    controller: c,
    style: TextStyle(color: Colors.white),
    textAlign: TextAlign.left,
    decoration: InputDecoration(
        labelText: moeda,
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow, width: 5.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber, width: 5.0),
        ),
        prefixText: simbolo,
        hintText: "insira aqui o valor"),
    onChanged: f,
    keyboardType: TextInputType.number,
  );
}
