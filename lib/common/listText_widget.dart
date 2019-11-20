import 'package:flutter/material.dart';
import 'package:ml_kit/model/Fojas.dart';

Widget listCardBuilderText(List<Foja> fojasSelected) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: fojasSelected.length,
    itemBuilder: (BuildContext context, int index) {
      return new GestureDetector(
        child: Card(
          child: Text(fojasSelected.elementAt(index).contenido,style:TextStyle(fontSize: 20),textAlign: TextAlign.center,),
        ),
      );
    },
  );
}


