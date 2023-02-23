import 'package:flutter/material.dart';

class ReportesUser extends StatelessWidget {
  const ReportesUser({super.key});
  static Widget create(BuildContext context) => ReportesUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Reportes', style: TextStyle(color: Colors.black)),
        leading: IconButton(
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
