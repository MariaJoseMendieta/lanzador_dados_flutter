import 'dart:math'; //Importa la biblioteca 'math' para generar números aleatorios
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF455A64),
        appBar: AppBar(
          title: Text('Lanzandor de Dados'),
          backgroundColor: Color(0xFFFFC107),
          centerTitle: true,
        ),
        body: MyApp(),
      ),
    ),
  );
}

//Widget con estado que maneja los dados
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Variables que almacenan el número actual de cada dado (1-6)
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  //Metodo para cambiar la cara de los dados aleatoriamente
  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  //Metodo que construye la interfaz gráfica
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          //Primer dado, ocupa el 50% del ancho disponible
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceFace(); //Cambia las caras al presionar
              },
              //Muestra una imagen del dado correspondiente al número
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          //Segundo dado, también ocupa el 50%
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceFace(); //Cambia las caras al presionar
              },
              //Muestra una imagen del dado correspondiente al número
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
