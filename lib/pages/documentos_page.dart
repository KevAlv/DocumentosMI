import 'package:flutter/material.dart';
import 'package:ml_kit/model/Documents.dart';
import 'package:ml_kit/services/database_services.dart';

import 'example_page.dart';


class DocumentosView extends StatefulWidget {
  DocumentosView({Key key}) : super(key: key);

  @override
  _DocumentosViewState createState() => _DocumentosViewState();
}

class _DocumentosViewState extends State<DocumentosView> {
  List<Documento> _documentos;

  @override
    void initState() {
    super.initState();
    _documentos = [];
    _getDocuments();
  }

    _selectDocument(){
          Navigator.push(context,new MaterialPageRoute(
            builder: (context)=>PlaceholderWidget(Colors.deepOrange)
          ));
    }

    _getDocuments() {
    Services.getDocuments().then((docs) {
      setState(() {
        _documentos = docs;
      });
    
    });
  }

 Widget bodyData() => DataTable(
   columnSpacing: 4.0,

          columns: <DataColumn>[

            DataColumn(
              onSort: (i, b) {},
                label: Text("Id"),
                ),
            DataColumn(
                label: Text("Fecha"),
                numeric: true,
                ),
                    DataColumn(
                label: Text("Nombre"),
                numeric: true,
                onSort: (i, b) {},
                ),
          ],
          rows: _documentos
              .map((documentonro) => DataRow(cells: [
                    DataCell(Text(documentonro.id.toString()),onTap:(){_selectDocument();} ),
                    DataCell(Text(documentonro.fecha),),
                    DataCell(Text(documentonro.title)),
                  ]))
              .toList());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: bodyData(),
         ),
       ),
    );
  }
}