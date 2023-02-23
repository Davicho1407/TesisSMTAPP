import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:smt_app/auth/login_page.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/drawer_admin.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static Widget create(BuildContext context) => const RegisterPage();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _FormularioRegister(),
    );
  }
}

class _FormularioRegister extends StatefulWidget {
  const _FormularioRegister({super.key});

  @override
  State<_FormularioRegister> createState() => __FormularioRegisterState();
}

class __FormularioRegisterState extends State<_FormularioRegister> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _cellnumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isObscure2 = true;
  bool showProgress = false;

  var options = [
    'Admin',
    'Usuario',
  ];
  var _currentItemSelected = "Usuario";
  var rool = "Usuario";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(String email, String password, String firstName,
      String lastName, int age, int numCelular, String rool) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Si el usuario se crea correctamente, llama a la función que guarda los datos en Firestore
      if (userCredential.user != null) {
        addUserDetails(userCredential.user!.uid, firstName, lastName, email,
            age, numCelular, rool);
        // Cerrar sesión
        await _auth.signOut();
        // Navegar a la página de inicio de sesión
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text:
              'Usted se ha registrado exitosamente, por favor regrese a la pantalla principal para ingresar',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // El correo electrónico ya está en uso, mostrar mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('El correo electrónico ya está en uso.'),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      print("Error al crear el usuario: $e");
    }
  }

  Future<void> addUserDetails(String userId, String firstName, String lastName,
      String email, int age, int numCelular, String rool) async {
    try {
      await db.collection('usuarios').doc(userId).set({
        'nombre': firstName,
        'apellido': lastName,
        'email': email,
        'edad': age,
        'numeroCelular': numCelular,
        'rool': rool
      });
      print("Datos guardados correctamente en Firestore.");
    } catch (e) {
      print("Error al guardar los datos en Firestore: $e");
    }
  }

  String? validator(String? value) {
    return (value == null || value.isEmpty)
        ? 'Este es un requisito obligatorio'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan.shade50,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Hey!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.supervised_user_circle,
                      size: 150,
                      color: Colors.greenAccent,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Registrate abajo con tu información!!',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Nombre textfield
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
                    //Apellido textfild
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
                    //Edad textfield
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
                    //Numero de celular
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                          controller: _cellnumberController,
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
                    //Email textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.greenAccent, width: 4),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Email',
                            fillColor: Colors.white),
                        validator: (value) {
                          if (value!.length == 0) {
                            return "Este es un requisito obligatorio";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Por favor ingresa un email");
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //COntraseña textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.greenAccent, width: 4),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Contraseña',
                            fillColor: Colors.white),
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Este es un requisito obligatio";
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Por favor ingrese una contraseña valida minima de 6 caracteres ");
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Confirmar contraseña
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _confirmpasswordController,
                        obscureText: _isObscure2,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure2
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure2 = !_isObscure2;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.greenAccent, width: 4),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Confirmar contraseña',
                            fillColor: Colors.white),
                        validator: (value) {
                          if (_confirmpasswordController.text !=
                              _passwordController.text) {
                            return "Contraseñas no coinciden";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Roles de usuario
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Rool : ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            DropdownButton<String>(
                              dropdownColor: Colors.greenAccent,
                              isDense: true,
                              isExpanded: false,
                              iconEnabledColor: Colors.black,
                              focusColor: Colors.black,
                              items: options.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  _currentItemSelected = newValueSelected!;
                                  rool = newValueSelected;
                                });
                              },
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Boton de inicio sesion
                    MaterialButton(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Text(
                              'Registrarme',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ))),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            register(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                _firstNameController.text,
                                _lastNameController.text,
                                int.parse(_ageController.text),
                                int.parse(_cellnumberController.text),
                                rool);
                          }
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    //No tienescuenta? registrate
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Ya soy un miembro! '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'Ingresar',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          )),
        ));
  }
}
