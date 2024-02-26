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
      home: MyHomePage() 
    );
  }

}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                'Este es un contenedor',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Image.network('https://picsum.photos/250?image=9', width: 200, height: 200,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 205, 33, 243)),
                    ),
                      onPressed: () { },
                      child: Text('TextButton'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // background
                      foregroundColor: Colors.white, // foreground
                    ),
                    onPressed: () { },
                    child: Text('ElevatedButton'),
                  )
              ],
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Ingrese su texto aquí',
                labelText: 'Texto',
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Elemento 1'),
                  ),
                  ListTile(
                    title: Text('Elemento 2'),
                  ),
                  ListTile(
                    title: Text('Elemento 3'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





