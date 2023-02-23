import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/drawer_admin.dart';
import 'package:smt_app/auth/login_page.dart';
import 'package:smt_app/ui/drawer/drawerUser/drawer_user.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User? user = snapshot.data;
          // accede al documento de usuario correspondiente en Firestore
          DocumentReference userDoc =
              FirebaseFirestore.instance.collection('usuarios').doc(user!.uid);
          return StreamBuilder<DocumentSnapshot>(
              stream: userDoc.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.exists) {
                  // obtiene el valor del campo de rol
                  String role = snapshot.data!.get('rool');
                  if (role == 'Admin') {
                    return DrawerAdmin();
                  } else if (role == 'Usuario') {
                    return DrawerUser();
                  } else {
                    return Center(child: Text('Role desconocido asignado'));
                  }
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Text('Cargando...')),
                      MaterialButton(
                          child: Text('Salir'),
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance.signOut();
                              // Navegar a la pantalla de inicio de sesión
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            } catch (e) {
                              print('El error es : $e');
                            }
                          })
                    ],
                  );
                }
              });
        } else {
          return LoginPage();
        }
      },
    ));
  }
}
