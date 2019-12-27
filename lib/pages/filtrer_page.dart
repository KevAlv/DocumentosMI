import 'package:flutter/material.dart';
import 'package:ml_kit/common/Texform_widget.dart';
import 'package:ml_kit/common/session_global.dart';

class FilterPage extends StatefulWidget {


  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar'),
      ),
      body:Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Icon(Icons.settings),
 SizedBox(height: 40.0,),
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
            Expanded(
              child: cajita(controlerc1),
            ),
            Expanded(
              child: cajita(controlerc2),
            ),
          ],
        ),
        ],
      ),
    );
  }
}
