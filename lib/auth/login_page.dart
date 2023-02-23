import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:quickalert/quickalert.dart';
import 'package:smt_app/auth/registro_page.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/drawer_admin.dart';
import 'package:smt_app/ui/drawer/drawerUser/drawer_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static Widget create(BuildContext context) => const LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.greenAccent.shade100,
                Colors.cyan.shade100,
                Colors.cyan.shade50,
              ]),
        ),
        child: PageIndicatorContainer(
          child: PageView(
            children: [
              _DescriptionPage(
                  text:
                      'La tecnología es nuestra herramienta para cuidar la siembra, logrando una cosecha sostenible y próspera.',
                  imagePath: 'assets/img/icon_intro_siembra.png'),
              _DescriptionPage(
                  text:
                      'La monitorización de la siembra mediante sensores de precisión, permite una optimización del uso de recursos y un mejor control del clima para lograr una cosecha sostenible y de alta calidad.',
                  imagePath: 'assets/img/icon_intro_sensor.png'),
              _DescriptionPage(
                  text:
                      'El monitoreo en tiempo real de la siembra a través del Internet de las Cosas, permite una mejor toma de decisiones para garantizar una cosecha saludable y sostenible.',
                  imagePath: 'assets/img/icon_intro_sistema.png'),
              _LoginScreen()
            ],
          ),
          length: 4,
          align: IndicatorAlign.bottom,
        ),
      ),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen({super.key});

  @override
  State<_LoginScreen> createState() => __LoginScreenState();
}

class __LoginScreenState extends State<_LoginScreen> {
  //texto controlers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('usuarios')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Admin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DrawerAdmin(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DrawerUser(),
            ),
          );
        }
      } else {
        QuickAlert.show(
          confirmBtnText: 'Entendido',
          context: context,
          type: QuickAlertType.error,
          text: 'Este usuario no se encuentra registrado',
        );
        print('Document does not exist on the database');
      }
    });
  }

  Future _signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
      route();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No se encontro el email del usuario');
      } else if (e.code == 'wrong-password') {
        QuickAlert.show(
          confirmBtnText: 'Entendido',
          context: context,
          type: QuickAlertType.error,
          text: 'Contraseña incorrecta',
        );
        print('Se proporcionó una contraseña incorrecta para ese usuario.');
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                    const Text(
                      'Hola de nuevo!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/img/Logo3.png',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Ingresa a tu cuenta: ',
                      style: TextStyle(fontSize: 20),
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
                        validator: validator,
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
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.greenAccent, width: 4),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Contraseña',
                            fillColor: Colors.white),
                        validator: validator,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                              'Olvidaste tu contraseña?',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/forgetpass');
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Boton de inicio sesion
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() == true) {
                            _signIn();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            'Ingresar',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //No tienescuenta? registrate
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('No esta registrado? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/registro');
                          },
                          child: Text(
                            'Registrate ahora!',
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

class _DescriptionPage extends StatelessWidget {
  final String text;
  final String imagePath;

  const _DescriptionPage({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(48.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          )),
        ],
      ),
    );
  }
}
