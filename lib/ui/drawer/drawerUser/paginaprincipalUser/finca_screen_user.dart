import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FincaScreenUser extends StatelessWidget {
  static Widget create(BuildContext context) => FincaScreenUser();

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
        'Finca "La Victoria"',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    ));
  }
}
