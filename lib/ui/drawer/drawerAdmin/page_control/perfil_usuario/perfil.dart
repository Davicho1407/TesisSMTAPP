import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

class PerfilAdmin extends StatefulWidget {
  const PerfilAdmin({super.key});
  static Widget create(BuildContext context) => PerfilAdmin();

  @override
  State<PerfilAdmin> createState() => _PerfilAdminState();
}

class _PerfilAdminState extends State<PerfilAdmin> {
  //Variables de getDatosID
  String nombre = '';
  String apellido = '';
  int edad = 0;
  int numeroCelular = 0;
  //Variables de imagen
  late String _uploadedImageUrl;
  late String _imageurl;

  File? imagen_to_upload;

  // Creamos una instacioa con nuestra base de firebaseauth
  final uid = FirebaseAuth.instance.currentUser?.uid;
  //Crear una instacia a firebase storage
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<XFile?> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<bool> uploadImage(File image) async {
    print(image.path);
    //La direccion la divide para quedarnos con el ultimo elemento
    final String namefile = image.path.split("/").last;

    //Creamos un espacio en storage para que recoja las imagenes
    final Reference ref = storage.ref().child("imagenes/$uid").child(namefile);

    //Creamos la tarea para subir el archivo de imagen
    final UploadTask uploadTask = ref.putFile(image);
    print(uploadTask);

    //Esto monitorea la tarea
    final TaskSnapshot snapshoTask = await uploadTask.whenComplete(() => true);
    print(snapshoTask);

    final String url = await snapshoTask.ref.getDownloadURL();
    print(url);

    if (snapshoTask.state == TaskState.success) {
      _uploadedImageUrl = url;
      return true;
    } else {
      return false;
    }
  }

  //Conseguimos los datos del usuario que esta en firebase firestore
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

  Future sentImage() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final userRef = firestore.collection('usuarios').doc(uid);
    await userRef.update({'url_imagen': _uploadedImageUrl});
  }

  @override
  Widget build(BuildContext context) {
    //Mejoramiento de codigo

    // Imagen por defecto que colocamos para el usuario
    Widget image = Image.asset(
      'assets/img/icon_user.png',
      fit: BoxFit.fill,
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          centerTitle: true,
          title: Text(
            'Perfil',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: (() {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/drawerAdmin');
            }),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/perfilAdmin');
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

// Vista de datos de firebase

//Clase de formulario
class EditarUser extends StatefulWidget {
  const EditarUser({super.key});

  @override
  State<EditarUser> createState() => _EditarUserState();
}

class _EditarUserState extends State<EditarUser> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _numCelularController = TextEditingController();

  String? validator(String? value) {
    return (value == null || value.isEmpty)
        ? 'Este es un requisito obligatorio'
        : null;
  }

  Future sentDatos() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(uid)
            .update({
          'nombre': _firstNameController.text,
          'apellido': _lastNameController.text,
          'edad': int.parse(_ageController.text),
          'numeroCelular': int.parse(_numCelularController.text),
        });
        QuickAlert.show(
          context: context,
          type: QuickAlertType.info,
          text:
              'Se ha actualizado sus datos, refresque la pantalla para observar sus cambios',
        );
        print('Datos actualizados correctamente');
      }
    } catch (e) {
      print('Error al actualizar los datos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    //Nombre update
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                          controller: _firstNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent, width: 4),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: 'Nombre',
                              fillColor: Colors.white),
                          validator: validator),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Apellido update
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                          controller: _lastNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent, width: 4),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: 'Apellido',
                              fillColor: Colors.white),
                          validator: validator),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Edad update
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent, width: 4),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: 'Edad',
                              fillColor: Colors.white),
                          validator: validator),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Numero celular update
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                          controller: _numCelularController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent, width: 4),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: 'Numero de celular',
                              fillColor: Colors.white),
                          validator: validator),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Boton de guardar

                    MaterialButton(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Text(
                              'Guardar datos',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ))),
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            setState(() {
                              sentDatos();
                            });
                          }
                        }),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
