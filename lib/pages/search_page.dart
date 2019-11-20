import 'package:flutter/material.dart';
import 'package:ml_kit/common/Texform_widget.dart';
import 'package:ml_kit/common/list_widget.dart';
import 'package:ml_kit/model/Fojas.dart';
import 'package:ml_kit/services/database_services.dart';

import 'filtrer_page.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();
  List<Foja> _fojasSelected;
  String word;
  int idDoc;
  int codDoc;
  @override
  void initState() {
    super.initState();
    _fojasSelected = [];
    _getFojas('');
  }

  _getFojas(String word, [int doc, int codDoc]) {
    Services.searchFojas(word, doc, codDoc).then((pages) {
      setState(() {
        _fojasSelected = pages;
      });
    });
  }
    filter() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => FilterPage()));
  }

  Widget seachBar() {
    return TextField(
      
      onChanged: (value) {
        if(value!=null){
            _getFojas(value);
        }
        
      },
      controller: editingController,
      decoration: InputDecoration(
          hintText: "Busqueda por palabra",
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(20),
          border: InputBorder.none,
          
              ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busqueda de texto'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: seachBar(),
          ),

        FlatButton(
          child: Row(children: <Widget>[Text('Filtrar'),Icon(Icons.settings)],),
          onPressed:filter,
        ),
          SizedBox(
            height: 2.0,
          ),
          Expanded(
            child:_fojasSelected.length!=0? listCardBuilder(_fojasSelected):Container(
              color: Colors.white,
            )
          )
        ],
      )),
    );
  }
}
