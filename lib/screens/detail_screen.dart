
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DetailScreen extends StatelessWidget {
   
  const DetailScreen({Key? key}) : super(key: key);

  static const route = "detail";

  

  
  
  @override
  Widget build(BuildContext context) {
    List<Option> options = [
      Option(icono: Ionicons.library_sharp, title: "Detalle General"),
      Option(icono: Ionicons.man_sharp, title: "Solicitante"),
      Option(icono: Ionicons.people_sharp, title: "Agregados"),
  ];


    return DefaultTabController(
      length: options.length,
      child: Scaffold(
        appBar: _appBarTab(options),
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
        auxiliar.add(Center(child: Text(element.title),)) ;
      });
      return auxiliar;
      }
        }
  


_appBarTab(options){
  
    return AppBar(
      bottom: TabBar(
        tabs: _headersTab(options) 
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

  Option({required this.icono, required this.title});

 

}