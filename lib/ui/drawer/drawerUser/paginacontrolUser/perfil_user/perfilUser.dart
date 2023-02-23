import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/page_control/perfil_usuario/perfil.dart';

class PerfilUser extends StatefulWidget {
  const PerfilUser({super.key});
  static Widget create(BuildContext context) => PerfilUser();

  @override
  State<PerfilUser> createState() => _PerfilUserState();
}

class _PerfilUserState extends State<PerfilUser> {
  //Variables de getDatosID
  String nombre = '';
  String apellido = '';
  int edad = 0;
  int numeroCelular = 0;
  // Creamos una instacioa con nuestra base de firebaseauth
  final uid = FirebaseAuth.instance.currentUser?.uid;
  Future getDatosID() async {
    if (uid != null) {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('usuarios').doc(uid);

      documentReference.get().then((DocumentSnapshot doc) {
        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            nombre = data['nombre'];
            apellido = data['apellido'];
            edad = data['edad'];
            numeroCelular = data['numeroCelular'];
          });
        } else {
          print('El documento no existe.');
        }
      }, onError: (e) => print('Error en conseguir los documentos: $e'));
    }
  }

  @override
  void initState() {
    super.initState();
    getDatosID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          centerTitle: true,
          title: Text(
            'Pefil',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: (() {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/drawerUser');
            }),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/perfilUser');
                // Lógica para el botón de búsqueda
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Información de perfil',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      transform: Matrix4.translationValues(0, 20, 0),
                      width: 500,
                      height: 175,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nombre: ' '$nombre',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Apellido: ' '$apellido'),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Edad: ' '$edad'),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Numero de celular: ' '$numeroCelular'),
                              ],
                            ),
                            // Column(
                            //   children: [
                            //     CachedNetworkImage(
                            //       imageUrl: _imageurl,
                            //       placeholder: (context, url) =>
                            //           CircularProgressIndicator(),
                            //       errorWidget: (context, url, error) =>
                            //           Icon(Icons.error),
                            //       width: 200,
                            //       height: 200,
                            //     )
                            //   ],
                            // )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    splashColor: Colors.cyanAccent,
                    color: Colors.greenAccent,
                    child: Text(
                      'Editar usuario',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Actualiza tus datos',
                                textAlign: TextAlign.center,
                              ),
                              content: EditarUser(),
                              actions: <Widget>[
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.greenAccent),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    elevation:
                                        MaterialStateProperty.all<double>(10.0),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Cerrar',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    }),
                SizedBox(
                  height: 30,
                ),
                // MaterialButton(
                //     height: 50,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(30))),
                //     splashColor: Colors.cyanAccent,
                //     color: Colors.greenAccent,
                //     child: Text('Subir imagen', style: TextStyle(fontSize: 20)),
                //     onPressed: () {
                //       showDialog(
                //           useSafeArea: true,
                //           context: context,
                //           builder: (BuildContext context) {
                //             return AlertDialog(
                //               title: Text(
                //                 'Subir imagen de perfil',
                //                 textAlign: TextAlign.center,
                //               ),
                //               content: Center(
                //                 child: Column(
                //                   children: [
                //                     Container(
                //                       child: GestureDetector(
                //                           onTap: () async {
                //                             final imagen = await getImage();
                //                             setState(() {
                //                               imagen_to_upload =
                //                                   File(imagen!.path);
                //                               sentImage();
                //                             });
                //                             final uploaded = await uploadImage(
                //                                 imagen_to_upload!);
                //                             if (uploaded) {
                //                               ScaffoldMessenger.of(context)
                //                                   .showSnackBar(const SnackBar(
                //                                       content: Text(
                //                                           "Imagen subida correctamente")));
                //                             } else {
                //                               ScaffoldMessenger.of(context)
                //                                   .showSnackBar(const SnackBar(
                //                                       content: Text(
                //                                           "Error al subir la imagen")));
                //                             }
                //                           },
                //                           child: Center(
                //                             child: ClipOval(
                //                                 child: Container(
                //                               width: 100,
                //                               height: 100,
                //                               child: imagen_to_upload != null
                //                                   ? Image.file(
                //                                       imagen_to_upload!)
                //                                   : image,
                //                             )),
                //                           )),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               actions: <Widget>[
                //                 TextButton(
                //                   style: ButtonStyle(
                //                     backgroundColor:
                //                         MaterialStateProperty.all<Color>(
                //                             Colors.greenAccent),
                //                     foregroundColor:
                //                         MaterialStateProperty.all<Color>(
                //                             Colors.white),
                //                     elevation:
                //                         MaterialStateProperty.all<double>(10.0),
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                       RoundedRectangleBorder(
                //                         borderRadius:
                //                             BorderRadius.circular(10.0),
                //                       ),
                //                     ),
                //                   ),
                //                   child: Text(
                //                     'Cerrar',
                //                     style: TextStyle(color: Colors.black),
                //                   ),
                //                   onPressed: () {
                //                     Navigator.of(context).pop();
                //                   },
                //                 ),
                //               ],
                //             );
                //           });
                //     })
              ],
            ),
          ),
        ));
  }
}
