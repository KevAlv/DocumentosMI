import 'package:flutter/material.dart';


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
      body:Container(color: Colors.blueAccent,),
    );
  }
}