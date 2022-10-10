import 'package:fl_mediadores_app/utiles/constants.dart';
import 'package:fl_mediadores_app/widgets/background_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   
  const LoginScreen({Key? key}) : super(key: key);

  static const route = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      
      body: BackGroundAuth(),
    );
  }
}