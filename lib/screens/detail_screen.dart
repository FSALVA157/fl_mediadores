
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
   
  const DetailScreen({Key? key}) : super(key: key);

  static const route = "detail";
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('DetailScreen'),
      ),
    );
  }
}