
import 'package:fl_mediadores_app/utiles/constants.dart';
import 'package:fl_mediadores_app/widgets/form_components.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GeneralScreen extends StatelessWidget {
   
  const GeneralScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return  Scaffold(
      //backgroundColor: kvioletShade1,
      body: Container(
        height: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1,0.5, 0.7, 0.9],
            colors: [
                  Colors.teal[900]!,
                  Colors.teal[700]!,
                  Colors.teal[500]!,
                  Colors.teal[400]!,
            ]
            )
        ),
        child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 30),
    
                child: Center(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SizedBox(height: size.height * 0.3,),
                      Container(
                        //height: size.height * 0.5,
                        width: double.infinity,              
                        child: Form(
                          child: Column(
                            children: [
                              inputFormField(TextInputType.text, 'Email / Username', Ionicons.mail_outline),
                              inputFormField(TextInputType.text, 'Fecha Inicio', Ionicons.calendar_clear_outline),
                              inputFormField(TextInputType.text, 'Nº de Expediente', Ionicons.documents_outline),
                              inputFormField(TextInputType.text, 'Abogado', Ionicons.glasses_outline),
                              // inputField('Password', Ionicons.lock_closed_outline),
                              // loginButton('Log In', ()=>Navigator.pushReplacementNamed(context, 'home')),
                              // forgotPassword(),
                            ],
                          )
                          ),
                      ),
                      SizedBox(height: size.height * 0.2,)
    
                    ],
                  ),
                ),
    
    
    
          
        ),
      ),
    );
  }
}