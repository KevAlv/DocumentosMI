import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
 final Color color;

 PlaceholderWidget(this.color);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title:Text('dafadfdfasf')),
     body: Container(color: color),
   );
 }
}