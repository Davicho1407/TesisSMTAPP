import 'package:flutter/material.dart';

class AdministracionesUsers extends StatefulWidget {
  const AdministracionesUsers({super.key});
  static Widget create(BuildContext context) => AdministracionesUsers();

  @override
  State<AdministracionesUsers> createState() => _AdministracionesUsersState();
}

class _AdministracionesUsersState extends State<AdministracionesUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Administración de Usuarios',
          style: TextStyle(color: Colors.black),
        ),
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
