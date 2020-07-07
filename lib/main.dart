import 'package:flutter/cupertino.dart';
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
  TextEditingController valor1Controller = TextEditingController();
  TextEditingController valor2Controller = TextEditingController();
  TextEditingController opController = TextEditingController();

  double calculo = 0;
  String btnCalcular = "Calcular";

  void resetar() {
    setState(() {});
  }

  double calcular(double valor1, String op, double valor2) {
    setState(() {
      if (op == "+") {
        calculo = valor1 + valor2;
        return calculo;
      } else if (op == "-") {
        calculo = valor1 - valor2;
        return calculo;
      } else if (op == "*") {
        calculo = valor1 * valor2;
        return calculo;
      } else if (op == "/") {
        calculo = valor1 * valor2;
        return calculo;
      } else {
        btnCalcular = "Bad :(";

        return btnCalcular;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              resetar();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: Column(
          children: <Widget>[
            Text(
              "$calculo",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Valor 1",
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
              controller: valor1Controller,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Operador ( * , / , + , -)",
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
              controller: opController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Valor 2",
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
              controller: valor2Controller,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                  width: 300,
                  child: RaisedButton(
                    onPressed: () {
                      calcular(
                          double.parse(valor1Controller.text),
                          opController.text,
                          double.parse(valor2Controller.text));
                    },
                    child: Text("$btnCalcular"),
                    color: Colors.black,
                    textColor: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
