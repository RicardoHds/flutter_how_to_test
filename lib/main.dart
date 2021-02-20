import 'package:DevSecOps/constants/colors.dart';
import 'package:DevSecOps/views/forgotPassword/forgotPassword.dart';
import 'package:DevSecOps/views/home/home.dart';
import 'package:DevSecOps/views/login/login.dart';
import 'package:DevSecOps/views/register/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutta Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: COLORS.TEXT,
        primaryColor: COLORS.TURQUOISE,
        scaffoldBackgroundColor: COLORS.WHITE,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => Login());
          case '/home':
            return MaterialPageRoute(builder: (context) => Home());
          case '/register':
            return MaterialPageRoute(builder: (context) => Register());
          case '/forgot-password':
            return MaterialPageRoute(builder: (context) => ForgotPassword());
          default:
            return MaterialPageRoute(builder: (context) => Login());
        }
      },
    );
  }
}
