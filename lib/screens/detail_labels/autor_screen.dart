 import 'package:fl_mediadores_app/widgets/form_components.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
 
 class AutorScreen extends StatelessWidget {
    
   const AutorScreen({Key? key}) : super(key: key);
   
   @override
   Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

     return  Scaffold(
             body: Container(
        height: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1,0.5, 0.7, 0.9],
            colors: [
                  Colors.blueGrey[900]!,
                  Colors.blueGrey[700]!,
                  Colors.blueGrey[500]!,
                  Colors.blueGrey[400]!,
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
                              inputFormField(TextInputType.text, 'Nombre', Ionicons.id_card_outline),
                              inputFormField(TextInputType.text, 'Apellido', Ionicons.id_card),
                              inputFormField(TextInputType.text, 'Nacimiento', Ionicons.calendar_number),
                              inputFormField(TextInputType.text, 'Domicilio', Ionicons.build_outline),
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