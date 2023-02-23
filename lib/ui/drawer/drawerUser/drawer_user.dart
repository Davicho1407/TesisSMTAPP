import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smt_app/auth/login_page.dart';

class DrawerUser extends StatefulWidget {
  const DrawerUser({super.key});
  static Widget create(BuildContext context) => const DrawerUser();

  @override
  State<DrawerUser> createState() => _DrawerUserState();
}

class _DrawerUserState extends State<DrawerUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'SMT APP: Usuario',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: null,
              decoration: BoxDecoration(color: Colors.greenAccent),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Control de monitoreo'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/controlMonitoreoUser');
              },
            ),
            ListTile(
              leading: Icon(Icons.document_scanner),
              title: Text('Reportes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/reportesUser');
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.admin_panel_settings),
            //   title: Text('Administración'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/administracionUsers');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Perfil de usuario'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/perfilUser');
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
                          Navigator.pushNamed(context, '/climaUser');
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
                          Navigator.pushNamed(context, '/fincaUser');
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
                          Navigator.pushNamed(context, '/cultivosUser');
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
                          Navigator.pushNamed(context, '/nosotrosUser');
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
