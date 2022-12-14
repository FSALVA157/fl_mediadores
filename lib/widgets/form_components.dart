import 'package:fl_mediadores_app/utiles/constants.dart';
import 'package:flutter/material.dart';



  Widget inputField(String hint, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String title, Function action) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        //horizontal: 135,
        vertical: 30),
      child: ElevatedButton(
        onPressed: () => action(),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
          shape: const StadiumBorder(),
          backgroundColor: kSecondaryColor,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget logos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/facebook.png'),
          const SizedBox(width: 24),
          Image.asset('assets/images/google.png'),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }

Widget inputFormField(TextInputType? kType, String hint, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical:20),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 0,
          //shadowColor: Colors.black87,
          color: Colors.transparent,
          //borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            keyboardType: (kType == null)? null: kType,
            textAlignVertical: TextAlignVertical.bottom,
                        
            decoration: InputDecoration(
              floatingLabelStyle: const TextStyle(color: Colors.white),  
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),                
              ),
              focusedBorder:  const UnderlineInputBorder(
                  borderSide:  BorderSide(color: Colors.white,
                  width: 5
                  )
              ),
              border: const UnderlineInputBorder(),
              //  OutlineInputBorder(
              //   borderRadius: BorderRadius.only(topRight:  Radius.circular(10), bottomLeft:  Radius.circular(10)),                
                
              // ),
              contentPadding: EdgeInsets.all(10),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              icon: Icon(iconData, color: Colors.yellow),
            ),
          ),
        ),
      ),
    );
  }
