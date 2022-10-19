
import 'dart:ui';

import 'package:fl_mediadores_app/screens/detail_labels/autor_screen.dart';
import 'package:fl_mediadores_app/screens/detail_labels/others_screen.dart';
import 'package:fl_mediadores_app/screens/screens.dart';
import 'package:fl_mediadores_app/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DetailScreen extends StatelessWidget {
   
  const DetailScreen({Key? key}) : super(key: key);

  static const route = "detail";

  

  
  
  @override
  Widget build(BuildContext context) {
    final String titulo = ModalRoute.of(context)?.settings.arguments.toString() ?? "Trámite en Curso";

    List<Option> options = [
      Option(icono: Ionicons.library_sharp, title: "Detalle General", screenTab: GeneralScreen() ),
      Option(icono: Ionicons.man_sharp, title: "Solicitante", screenTab: AutorScreen()),
      Option(icono: Ionicons.people_sharp, title: "Agregados", screenTab: OthersScreen()),
  ];


    return DefaultTabController(
      length: options.length,
      child: Scaffold(
        appBar: _appBarTab(options, titulo),
        body: _BodyTab(data: options),
      )
      );
    
  }
}

class _BodyTab extends StatelessWidget {
  final List<Option> data;

  const _BodyTab({
    Key? key, required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return TabBarView(
      children: MiMetodo()
    );
      }
      
    List<Widget >MiMetodo() {
      List<Widget> auxiliar = [];      
        data.forEach((element) {
        auxiliar.add(element.screenTab,) ;
      });
      return auxiliar;
      }
        }
  


_appBarTab(options, String titulo){
  
    return PreferredSize(
      preferredSize: Size.fromHeight(140),
      child: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(titulo, maxLines: 2, textAlign: TextAlign.start,),
        titleTextStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, fontSize: 22, overflow: TextOverflow.ellipsis),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 8.0,
          
          tabs: _headersTab(options) 
          ),
      ),
    );
  }


  List<Tab> _headersTab(List<Option> options){
    List<Tab> list=[];
    
    options.forEach((Option element) {
      list.add(Tab(
          icon: Icon(element.icono),
          text: element.title,
      ));
     });
      return list;
      
  }


  _buildTab(Option option){
    return Tab(
      icon: Icon(option.icono),

    );
  }






class Option{
  
  final IconData icono;  
  final String title;
  final Widget screenTab;

  Option({required this.icono, required this.title, required this.screenTab});

 

}