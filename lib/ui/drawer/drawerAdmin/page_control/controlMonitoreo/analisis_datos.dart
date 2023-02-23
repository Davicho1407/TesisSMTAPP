import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnalizarDatos extends StatefulWidget {
  static Widget create(BuildContext context) => AnalizarDatos();

  const AnalizarDatos({super.key});

  @override
  State<AnalizarDatos> createState() => _AnalizarDatosState();
}

class _AnalizarDatosState extends State<AnalizarDatos> {
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
  String _value1 = '';
  String _value2 = '';
  String _value3 = '';

  void _generateValues() {
    setState(() {
      _value1 =
          '${_random.nextInt(5) + 25}.${_random.nextInt(100).toString().padLeft(2, '0')}';
      _value2 =
          '${_random.nextInt(2) + 20}.${_random.nextInt(100).toString().padLeft(2, '0')}';
      _value3 =
          '${_random.nextInt(1) + 6}.${_random.nextInt(100).toString().padLeft(2, '0')}';
    });
  }

  final _random = new Random();
  final words = [
    'alrveja',
    'cebada',
    'trigo',
    'papa',
    'cebolla',
    'haba',
    'frijol',
    'maiz'
  ];

  @override
  void initState() {
    super.initState();
    _selectWord();
  }

  String _word = '';
  void _selectWord() {
    setState(() {
      final random = Random();
      final index = random.nextInt(words.length);
      _word = words[index];
    });
  }

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
                    '${_word}',
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
                    '${_random.nextInt(5) + 25}.${_random.nextInt(100).toString().padLeft(2, '0')}°C',
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
                    '${_random.nextInt(2) + 20}.${_random.nextInt(100).toString().padLeft(2, '0')}%',
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
                    '${_random.nextInt(1) + 6}.${_random.nextInt(100).toString().padLeft(2, '0')}',
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
                    '${_word}',
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
                    '${_random.nextInt(5) + 25}.${_random.nextInt(100).toString().padLeft(2, '0')}°C',
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
                    '${_random.nextInt(2) + 20}.${_random.nextInt(100).toString().padLeft(2, '0')}%',
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
                    '${_random.nextInt(1) + 6}.${_random.nextInt(100).toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 20),
                  )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
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
                    '${_word}',
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
                    '${_random.nextInt(5) + 25}.${_random.nextInt(100).toString().padLeft(2, '0')}°C',
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
                    '${_random.nextInt(2) + 20}.${_random.nextInt(100).toString().padLeft(2, '0')}%',
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
                    '${_random.nextInt(1) + 6}.${_random.nextInt(100).toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 20),
                  )),
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
}
