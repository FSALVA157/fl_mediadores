
import 'package:fl_mediadores_app/models/persona_model.dart';
import 'package:fl_mediadores_app/widgets/form_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stylish_dialog/stylish_dialog.dart';


class OthersScreen extends StatelessWidget {
   
  const OthersScreen({Key? key}) : super(key: key);
  
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
                  Colors.cyan[900]!,
                  Colors.cyan[700]!,
                  Colors.cyan[500]!,
                  Colors.cyan[400]!,
            ]
            )
        ),
        child: const SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: _listaPersonas()          
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _AddPersonButton(),
     );
  }
}

class _AddPersonButton extends StatelessWidget {
  const _AddPersonButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
       onPressed: () async {
        

        String barcodeScanRes;
        // Platform messages may fail, so we use a try/catch PlatformException.
        try {
          barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'Cancel', true, ScanMode.DEFAULT
              );
          if (barcodeScanRes == '-1') {
            return StylishDialog(
              context: context,
              alertType: StylishDialogType.ERROR,
              titleText: 'Escaneo Cancelado!',
            ).show();
          }

          List<String> array = barcodeScanRes.split('@');

          if (array.length != 9) {
            return StylishDialog(
              context: context,
              alertType: StylishDialogType.ERROR,
              titleText: 'Código No Váido!',
            ).show();
          }



          StylishDialog errorDialog = StylishDialog(
              context: context,
              alertType: StylishDialogType.ERROR,
              titleText: 'NO PUEDE INGRESAR!',              
              //contentText: dataProvider.data.toString(),
              dismissOnTouchOutside: true,
              );

          StylishDialog dialog = StylishDialog(
            context: context,
            alertType: StylishDialogType.PROGRESS,
            animationLoop: false,
            titleText: 'Procesando...',
            dismissOnTouchOutside: false,
          );

          StylishDialog dialogAutorizado = StylishDialog(
            context: context,
            alertType: StylishDialogType.SUCCESS,
            animationLoop: false,
            titleText: 'Persona Autorizada!!',
            dismissOnTouchOutside: true,
          );

          //dialog.show();
          //providerDni.getData(array);
          String dato_dni = array[4].toString();
          array.forEach((element) {
            print(element);
          });
          //var servicio = VisitaService();

          try {
            //PersonalElement visita = await servicio.getByDni(dato_dni);
            //var bandera = await dataProvider.verificarProhibida(dato_dni);            
            //if(bandera){
             // print('LA BANDERA ES TRUE');
              //print(dataProvider.data);
              // dialog.dismiss();
              // errorDialog.show();  
              // showDialog(
              //   context: context, 
              //   builder: (context){
              //       return AlertDialog(
              //            title: Text('Motivo de la Prohibicion'),
              //   //         content: Text(dataProvider.data),
              //          );
              //   }
              //   );
              
            // }else{
            
            //   dialog.dismiss();
              dialogAutorizado.show();
            //}
            //Navigator.pushNamed(context, 'details', arguments: visita);
          } catch (e) {
            dialog.dismiss();
            errorDialog.show();
          }
        } catch (e) {
          barcodeScanRes = 'Failed to get platform version.';
        }
      },
      child: Icon(Ionicons.person_add_outline),
    );
  }
}




class _listaPersonas extends StatelessWidget {
  const _listaPersonas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<PersonaModel> personasList = [
      PersonaModel("María Laura", "García",DateTime.parse("1990-05-01"), 28163897),
      PersonaModel("Santiago Manuel", "Orozco",DateTime.parse("2000-09-21"), 30125321)
    ];


    return ExpansionPanelList.radio(
        animationDuration: Duration(milliseconds: 500),
        expandedHeaderPadding: EdgeInsets.all(10),
        elevation: 3,
        children: _expansionPanelChildren(personasList),

    );
  }

  List<ExpansionPanel>  _expansionPanelChildren(List<PersonaModel> listado) {
    List<ExpansionPanel> bodyList = [];
    listado.forEach((element) { 
      final panel = ExpansionPanelRadio(
        value: element.dni.toString(),
        canTapOnHeader: true,
        headerBuilder:((context, isExpanded) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListTile(
              leading: const Icon(Ionicons.person_outline),
              textColor: Colors.black54,
              title: Text('${element.apellido} ${element.nombre}',style:TextStyle(fontWeight: FontWeight.bold, fontSize: 21), textAlign: TextAlign.center),
              subtitle: Text('${element.dni}',style:Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
            ),
          );
        }), 
        body: Container(
          height: 100,
          child: Text("Aliquip cillum labore ipsum commodo duis in. Laborum cillum magna culpa id dolore. Laborum minim enim cillum adipisicing in nisi non excepteur.")
        ));
        bodyList.add(panel);
    }    
    ); 
    return bodyList;
  }
}