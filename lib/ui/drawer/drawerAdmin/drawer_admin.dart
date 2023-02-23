import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smt_app/auth/login_page.dart';

class DrawerAdmin extends StatefulWidget {
  const DrawerAdmin({super.key});
  static Widget create(BuildContext context) => const DrawerAdmin();

  @override
  State<DrawerAdmin> createState() => _DrawerAdminState();
}

class _DrawerAdminState extends State<DrawerAdmin> {
  String nombre = '';
  String apellido = '';
  String email = '';
  final user = FirebaseAuth.instance.currentUser?.uid;
  Future getDatosID() async {
    if (user != null) {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('usuarios').doc(user);

      documentReference.get().then((DocumentSnapshot doc) {
        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            nombre = data['nombre'];
            apellido = data['apellido'];
            email = data['email'];
          });
        } else {
          print('El documento no existe.');
        }
      }, onError: (e) => print('Error en conseguir los documentos: $e'));
    }
  }

  @override
  void initState() {
    getDatosID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'SMT APP: Administrador',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset('assets/img/user_drawer.png'),
              accountName: Text(
                'Usuario: $nombre ' '$apellido',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              accountEmail: Text(
                'Email: $email',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              decoration: BoxDecoration(color: Colors.tealAccent),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Control de monitoreo'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/controlMonitoreo');
              },
            ),
            ListTile(
              leading: Icon(Icons.document_scanner),
              title: Text('Reportes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/reportes');
              },
            ),
            ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text('Administración'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/administracionAdmin');
              },
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Perfil de usuario'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/perfilAdmin');
              },
            ),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text('Salir'),
                onTap: () async {
                  try {
                    await FirebaseAuth.instance.signOut();
                    // Navegar a la pantalla de inicio de sesión
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  } catch (e) {
                    print(e);
                  }
                }),
            Transform.translate(
              offset: Offset(0, 180),
              child: Text(
                DateFormat('HH:mm').format(DateTime.now()),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Transform.translate(
              offset: Offset(0, 180),
              child: Text(
                DateFormat.EEEE().format(DateTime.now()),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Transform.translate(
              offset: Offset(0, 180),
              child: Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: _PaginaPrincipal(),
    );
  }
}

class _PaginaPrincipal extends StatefulWidget {
  const _PaginaPrincipal({super.key});

  @override
  State<_PaginaPrincipal> createState() => __PaginaPrincipalState();
}

class __PaginaPrincipalState extends State<_PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Transform.translate(
          offset: Offset(-30, 10),
          child: Container(
            height: 60,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Pagina Principal',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                Transform.translate(
                    offset: Offset(40, 90),
                    child: Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Clima',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                    )),
                Transform.translate(
                  offset: Offset(40, 120),
                  child: Container(
                    width: 120,
                    height: 120,
                    child: FloatingActionButton(
                        heroTag: 'clima',
                        backgroundColor: Colors.amberAccent.shade100,
                        child: Icon(Icons.device_thermostat_outlined,
                            size: 70, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/clima');
                        }),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Transform.translate(
                    offset: Offset(60, 90),
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Finca "La Victoria"',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                    )),
                Transform.translate(
                  offset: Offset(60, 120),
                  child: Container(
                    width: 120,
                    height: 120,
                    child: FloatingActionButton(
                        heroTag: 'Finca',
                        backgroundColor: Colors.amberAccent.shade100,
                        child: Icon(Icons.house_siding_outlined,
                            size: 70, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/finca');
                        }),
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Transform.translate(
                    offset: Offset(40, 350),
                    child: Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Cultivos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                    )),
                Transform.translate(
                  offset: Offset(40, 380),
                  child: Container(
                    width: 120,
                    height: 120,
                    child: FloatingActionButton(
                        heroTag: 'cultivos',
                        backgroundColor: Colors.amberAccent.shade100,
                        child: Icon(Icons.local_florist_outlined,
                            size: 70, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/cultivos');
                        }),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Transform.translate(
                    offset: Offset(60, 350),
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Sobre nosotros',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                    )),
                Transform.translate(
                  offset: Offset(60, 380),
                  child: Container(
                    width: 120,
                    height: 120,
                    child: FloatingActionButton(
                        heroTag: 'nosotros',
                        backgroundColor: Colors.amberAccent.shade100,
                        child: Icon(Icons.person_pin_rounded,
                            size: 70, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/nosotros');
                        }),
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}

// class NameDrawer extends StatelessWidget {
  

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw Scaffold(
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('user')
//             .doc(user.uid)
//             .snapshots(),
//       ),
//     );
//   }
// }
