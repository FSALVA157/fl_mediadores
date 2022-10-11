import 'package:fl_mediadores_app/utiles/constants.dart';
import 'package:fl_mediadores_app/widgets/background_auth.dart';
import 'package:fl_mediadores_app/widgets/form_components.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LoginScreen extends StatefulWidget {
   
  const LoginScreen({Key? key}) : super(key: key);

  static const route = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: kBackgroundColor,
      
      body:  Stack(
        children: [
            BackGroundAuth(),
            Positioned(
              top: 80,
              left: 30,
              child: Container(
                width: size.width * 0.7,
                child: Text('Bienvenido!', style: TextStyle(fontSize: 40),maxLines: 4, overflow: TextOverflow.clip, textAlign: TextAlign.justify,))
              ),
            _formBody()

        ],
      )
      
    );
  }
}

class _formBody extends StatelessWidget {
  const _formBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 50),

      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.3,),
            Container(
              //height: size.height * 0.5,
              //width: size.width * 0.8,              
              child: Form(
                child: Column(
                  children: [
                    inputField('Email / Username', Ionicons.glasses),
                    inputField('Password', Ionicons.lock_closed_outline),
                    loginButton('Log In'),
                    forgotPassword(),
                  ],
                )
                ),
            ),
            SizedBox(height: size.height * 0.3,)

          ],
        ),
      ),
    );
  }
}