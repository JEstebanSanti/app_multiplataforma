import 'dart:ffi';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora de IMC",
      theme: ThemeData.dark(),
      home: CalculadoraIMC(),
    );
  }

}

class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCSTATE createState() => _CalculadoraIMCSTATE();
}

class _CalculadoraIMCSTATE extends State<CalculadoraIMC> {
  String resultado = "";
  TextEditingController weigthController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Title(color: Colors.pink, child: Text("Tu IMC es de: "+ resultado.toString())),
            SizedBox(height: 100),
            TextField(
              controller: weigthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Introduce el peso en KG'
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Introduce el altura en metros'
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(onPressed: () {calculaImc(double.tryParse(heightController.text) ?? 0, double.tryParse(weigthController.text) ?? 0 );}, child: Text('Calcular'))
          ],
        ),
      ),
    );
  }

  void calculaImc(double altura, double peso) {
    //double? altura = double.tryParse(heightController.text) ?? 0;
    //double? peso = double.tryParse(weigthController.text) ?? 0;
    String res = "";
    res = (peso / pow(altura, 2)).toStringAsFixed(1);
    setState(() {
      resultado = res;
    });

  }
}













