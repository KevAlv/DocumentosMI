import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Busqueda de texto'),),
     body: Container(
       child:Column(
         children: <Widget>[
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){

                },

                 controller: editingController,
                decoration: InputDecoration(
                    labelText: "Busqueda",
                    hintText: "Busqueda",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
           )
         ],
       )
     ),
   );
  }
}
