import 'dart:math';

import 'package:flutter/material.dart';

class ControlMonitoreoUser extends StatelessWidget {
  const ControlMonitoreoUser({super.key});
  static Widget create(BuildContext context) => ControlMonitoreoUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
        title: Text('Control de prototipo',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: (() {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/drawerUser');
          }),
        ),
      ),
    );
  }
}

class _ManejoSensor extends StatefulWidget {
  const _ManejoSensor({super.key});

  @override
  State<_ManejoSensor> createState() => __ManejoSensorState();
}

class __ManejoSensorState extends State<_ManejoSensor> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 35, 0),
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(7),
                child: Text(
                  'Monitoreo de prototipo',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              transform: Matrix4.translationValues(100, 0, 0),
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
                    'A continuaci??n, le mostramos la funcionalidad del prototipo, en la cual podremos recaudar los datos de los sensores como lo son la temperatura, humedad y pH. Estas son fundamentales para a continuaci??n realizar un an??lisis de que cultivo es m??s adaptable realizar en el terreno. ',
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
              height: 600,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.cyan.shade50,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(children: <Widget>[
                Center(
                  child: Text('Temperatura', style: TextStyle(fontSize: 20)),
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
                    '${_value1}??C',
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 32,
                ),
                Center(
                  child: Text('Humedad', style: TextStyle(fontSize: 20)),
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
                    '${_value2} %',
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 32,
                ),
                Center(
                  child: Text('pH', style: TextStyle(fontSize: 20)),
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
                    _value3,
                    style: TextStyle(fontSize: 20),
                  )),
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
                      'Obtener datos',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      _generateValues();
                      //generar valores random
                    }),
                SizedBox(
                  height: 32,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
