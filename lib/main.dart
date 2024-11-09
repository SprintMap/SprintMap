import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sprintmap/tuna_login/login_page.dart';
import 'package:sprintmap/tuna_login/signUp.dart';
import 'package:sprintmap/views/intro_slider_view/splash_screen.dart';

import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SprintMap App',
      routes: {
        "/loginPage": (context) => LoginPage(),
        "/signUp": (context) => SignUp(),
        "/homePage": (context) => HomePage()
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
