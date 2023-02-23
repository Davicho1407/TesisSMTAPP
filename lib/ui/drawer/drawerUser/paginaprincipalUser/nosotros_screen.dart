import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NosotrosScreenUser extends StatelessWidget {
  static Widget create(BuildContext context) => NosotrosScreenUser();

  const NosotrosScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        elevation: 0.0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: (() {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/drawerUser');
          }),
        ),
        title: const Text(
          'Sobre nosotros',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: __CuerpoNosotros(),
    );
  }
}

class __CuerpoNosotros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(17),
            child: Container(
              alignment: Alignment.center,
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Transform.translate(
                      offset: Offset(-90, 10),
                      child: Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Información',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-120, 10),
                      child: Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Nombre y Apellido',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-20, 0),
                      child: Container(
                        width: 300,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'David Iván Imbaquingo Ayala',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-120, 0),
                      child: Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Correo electronico',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-20, -10),
                      child: Container(
                        width: 300,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'david.imbaquingo@upec.edu.ec',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-120, -10),
                      child: Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Número de contacto',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-20, -20),
                      child: Container(
                        width: 300,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '0963294105',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-120, -20),
                      child: Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Dirección',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-20, -30),
                      child: Container(
                        width: 300,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Tulcán, Carchi, Ecuador',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(17),
            child: Container(
              transform: Matrix4.translationValues(0, 350, 0),
              alignment: Alignment.center,
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Transform.translate(
                      offset: Offset(-90, 10),
                      child: Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Información',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-120, 10),
                      child: Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Nombre y Apellido',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-20, 0),
                      child: Container(
                        width: 300,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Gandhy Darmell Ormaza Montenegro',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-120, 0),
                      child: Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Correo electronico',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-20, -10),
                      child: Container(
                        width: 300,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'gandhy.ormaza@upec.edu.ec',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-120, -10),
                      child: Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Número de contacto',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-20, -20),
                      child: Container(
                        width: 300,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '0992588981',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-120, -20),
                      child: Container(
                        width: 130,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Dirección',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                  Transform.translate(
                      offset: Offset(-20, -30),
                      child: Container(
                        width: 300,
                        // decoration: BoxDecoration(
                        //   color: Colors.cyanAccent.shade100,
                        //   borderRadius: BorderRadius.all(Radius.circular(30)),
                        // ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'San Gabriel, Carchi, Ecuador',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
