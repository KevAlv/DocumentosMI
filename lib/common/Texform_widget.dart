import 'package:flutter/material.dart';

Widget rowdecajitas(){
  return Row(
    children: <Widget>[
          cajita(),
          cajita(),
    ],
  );
}

Widget cajita([TextEditingController myController]){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(),
      controller: myController,
      
    ),
  );
}