import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smt_app/auth/login_page.dart';

class GetUserName extends StatefulWidget {
  final String documentId;

  const GetUserName({super.key, required this.documentId});

  @override
  State<GetUserName> createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // // void _eliminarRegistro() async {
  // //   try {
  // //     User? user = _auth.currentUser;
  // //     String userId = user!.uid;

  // //     await _firestore.collection('usuarios').doc(userId).delete();
  // //     await user.delete();

  // //     ScaffoldMessenger.of(context).showSnackBar(
  // //         const SnackBar(content: Text("Usuario eliminado correctamente")));
  // //     Navigator.pushReplacement(
  // //         context, MaterialPageRoute(builder: (context) => LoginPage()));
  // //   } catch (e) {
  // //     ScaffoldMessenger.of(context).showSnackBar(
  // //         const SnackBar(content: Text("No se ha podido eliminar")));
  // //     print('Error al eliminar el registro: $e');
  // //     Navigator.pushReplacement(
  // //         context, MaterialPageRoute(builder: (context) => LoginPage()));
  // //   }

  // //   // Realizar alguna acción después de eliminar el registro
  // // }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre :  ${data['nombre']}' ' ${data['apellido']}',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Email:  ${data['email']}',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Rol: ${data['rool']}', style: TextStyle(fontSize: 16))
                ],
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     IconButton(
              //         onPressed: () {
              //           _eliminarRegistro();
              //         },
              //         icon: Icon(Icons.delete))
              //   ],
              // )
            ],
          );
        }
        return Text('Loading...');
      }),
    );
  }
}
