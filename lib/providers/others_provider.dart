
import 'package:fl_mediadores_app/models/persona_model.dart';
import 'package:flutter/cupertino.dart';

class OthersProvider extends ChangeNotifier{

  List<PersonaModel> personas = [
    PersonaModel("María Laura", "García",DateTime.parse("1990-05-01"), 28163897),
      PersonaModel("Santiago Manuel", "Orozco",DateTime.parse("2000-09-21"), 30125321)
  ];

    // this.dniTramite = datos[0]; 
    // this.dniApellido = datos[1];
    // this.dniNombre = datos[2];
    // this.dniSexo = datos[3];
    // this.dniNumero = datos[4];
    // this.dniEjemplar = datos[5];
    // this.dniNacimiento = datos[6];
    // this.dniFechaTramite = datos[7];

  addPersonFromBarCode(List<String> data){
    final nuevo = PersonaModel(data[2],data[1] , DateTime.parse("1990-05-01"), int.parse(data[4]));
    personas.add(nuevo);
    notifyListeners();
  }
}