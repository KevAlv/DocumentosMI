import 'package:flutter/material.dart';
import 'package:ml_kit/common/session_global.dart';
List <String> lista=['1', '2', '3', '4'];
List <String> lista2=['1', '2', '3', '4'];
Widget dropDownSelectExpediente() {
  return DropdownButton<String>(
    items: lista.map((String value) {
        idDocumentoGlobal=int.parse(value);
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text('Expediente: ' + value),
      );
    }).toList(),
    onChanged: (_) {

    },
  );
}

Widget dropDownSelectDocumento() {
  return DropdownButton<String>(
    items:lista2.map((String value){
      codExpedienteGlobal=int.parse(value);
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text('Documento: ' + value),
      );
    }).toList(),
    onChanged: (_) {},
  );
}

Widget rowWidgetFilter() {
  return Center(
      child: Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Id Documento'),
          Text('Cod Expediente '),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          dropDownSelectDocumento(),
          dropDownSelectExpediente(),
          
          // dropDownSelect()
        ],
      ),
    ],
  ));
}
