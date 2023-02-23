import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smt_app/auth/main_page.dart';
import 'package:smt_app/route/route.dart';
import 'package:smt_app/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      onGenerateRoute: Routes.routes,
      home: MainPage(),
    );
  }
}
