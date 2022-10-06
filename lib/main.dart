import 'package:fl_mediadores_app/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medidadores App',
      initialRoute: LoginScreen.route,
      routes: {
        LoginScreen.route: (context) => const LoginScreen(),
        HomeScreen.route:(context) => const HomeScreen(),
        RegisterScreen.route:(context) => const RegisterScreen()
      },
      
    );
  }
}