import 'package:flutter/material.dart';
import 'package:ml_kit/common/DropDown_widget.dart';
import 'package:ml_kit/common/list_widget.dart';
import 'package:ml_kit/model/Fojas.dart';
import 'package:ml_kit/services/database_services.dart';

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

  Widget seachBar() {
    return TextField(
      onChanged: (value) {
        _getFojas(value);
      },
      controller: editingController,
      decoration: InputDecoration(
          labelText: "Busqueda",
          hintText: "Busqueda",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)))),
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
          SizedBox(
            height: 10.0,
          ),
          rowWidgetFilter(),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: listCardBuilder(_fojasSelected),
          )
        ],
      )),
    );
  }
}
