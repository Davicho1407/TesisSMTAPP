import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnalizarDatos extends StatefulWidget {
  final String value2;

  const AnalizarDatos({Key? key, required this.value2}) : super(key: key);
  @override
  State<AnalizarDatos> createState() => _AnalizarDatosState();
}

class _AnalizarDatosState extends State<AnalizarDatos> {
  final uid = FirebaseAuth.instance.currentUser?.uid;

  Future<void> obtenerDatos() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('usuarios').doc(uid);
    final datos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
        title: Text('Analizar datos',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: (() {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/drawerAdmin');
          }),
        ),
      ),
      body: _DatosAnalisis(),
    );
  }
}

class _DatosAnalisis extends StatefulWidget {
  const _DatosAnalisis({super.key});

  @override
  State<_DatosAnalisis> createState() => __DatosAnalisisState();
}

class __DatosAnalisisState extends State<_DatosAnalisis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: 32,
          ),
          Container(
            transform: Matrix4.translationValues(150, 0, 0),
            height: 50,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.cyanAccent,
                borderRadius: BorderRadius.all((Radius.circular(30)))),
            child: Padding(
              padding: EdgeInsets.all(9),
              child: Text(
                'Indicaciones',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Para una mayor toma de decisiones hemos optado en colocar un ánalisis de los datos obtenidos para que pueda establecer que planta esta concorde a los parametros obtenidos. ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Asi llegamos al metodo semaforización, donde los colores representa lo siguiente',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 5.0,
              height: 40,
              color: Colors.blue.shade900,
              child: Text(
                'Analizar de datos',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  generateRandomWords(0, '1');
                });

                //generar valores random
              }),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 350,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: <Widget>[
                Text(
                  'Sucepstible para cultivo',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all((Radius.circular(30)))),
                  child: Center(
                      child: Text(
                    randomWords[0],
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all((Radius.circular(30)))),
                  child: Center(
                      child: Text(
                    randomWords[1],
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all((Radius.circular(30)))),
                  child: Center(
                      child: Text(
                    randomWords[2],
                    style: TextStyle(fontSize: 20),
                  )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 350,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.yellow.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: <Widget>[
                Text(
                  'Regular para cultivo',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all((Radius.circular(30)))),
                  child: Center(
                      child: Text(
                    randomWords[3],
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all((Radius.circular(30)))),
                  child: Center(
                      child: Text(
                    randomWords[4],
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all((Radius.circular(30)))),
                  child: Center(
                      child: Text(
                    randomWords[5],
                    style: TextStyle(fontSize: 20),
                  )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 350,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: <Widget>[
                Text(
                  'No recomendado para cultivo',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all((Radius.circular(30)))),
                  child: Center(
                      child: Text(
                    randomWords[6],
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all((Radius.circular(30)))),
                  child: Center(
                      child: Text(
                    word8,
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all((Radius.circular(30)))),
                  child: Center(
                      child: Text(
                    word9,
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
        ]),
      ),
    );
  }

  String value2 = '0';

  final List<String> finalWords = [
    'alrveja',
    'cebada',
    'trigo',
    'papa',
    'cebolla',
    'haba',
    'frijol',
    'maiz',
    'quinua'
  ];
  List<String> randomWords = List.filled(8, '');
  String word1 = '';
  String word2 = '';
  String word3 = '';
  String word4 = '';
  String word5 = '';
  String word6 = '';
  String word7 = '';
  String word8 = '';
  String word9 = '';

  void generateRandomWords(int excludeCount, String value2) {
    // Verifica que la longitud del array sea mayor o igual al número de índices aleatorios que se generarán
    int numRandomIndices = min(8, finalWords.length - excludeCount);

    // Genera un conjunto de índices aleatorios únicos en el rango de 0 a la longitud del array menos uno, excluyendo los índices que se deben omitir
    Set<int> randomIndices = Set();
    while (randomIndices.length < numRandomIndices) {
      int index = Random().nextInt(finalWords.length);
      if (excludeCount > 0 && index < excludeCount)
        continue; // Salta los índices que se deben omitir
      randomIndices.add(index);
    }

    // Usa los índices aleatorios para seleccionar las palabras al azar del array finalWords
    List<String> selectedWords =
        randomIndices.map((i) => finalWords[i]).toList();

    // Selecciona una palabra al azar del conjunto de palabras seleccionadas al azar y la asigna a cada widget
    Set<String> uniqueWords = Set();
    for (int i = 0; i < selectedWords.length && uniqueWords.length < 7; i++) {
      String word = selectedWords[i];
      if (!uniqueWords.contains(word)) {
        uniqueWords.add(word);
        randomWords[uniqueWords.length - 1] = word;
      }
    }

    if (value2 == '0') {
      for (int i = 0; i < 4; i++) {
        randomWords[i] = '';
      }
    }

    setState(() {});
  }
  // @override
  // void initState() {
  //   _selectWord();

  //   super.initState();
  // }

  // String _word = '';
  // void _selectWord() {
  //   setState(() {
  //     final random = Random();
  //     final index = random.nextInt(words.length);
  //     _word = words[index];
  //   });
  // }

}
