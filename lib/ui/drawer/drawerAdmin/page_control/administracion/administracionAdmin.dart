import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/page_control/administracion/get_user_name.dart';

class AdministracionesAdmin extends StatefulWidget {
  const AdministracionesAdmin({super.key});
  static Widget create(BuildContext context) => AdministracionesAdmin();

  @override
  State<AdministracionesAdmin> createState() => _AdministracionesAdminState();
}

class _AdministracionesAdminState extends State<AdministracionesAdmin> {
  final user = FirebaseAuth.instance.currentUser!;

  ///Documentos IDs
  List<String> docIds = [];

  //Conseguir docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('usuarios')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIds.add(document.reference.id);
            }));
  }

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
            Navigator.pushNamed(context, '/drawerAdmin');
          }),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Usuarios que se encuentran registrados en la aplicación: ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                              color: Colors.cyanAccent.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                title: GetUserName(documentId: docIds[index]),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            )),
          ],
        ),
      )),
    );
  }
}
