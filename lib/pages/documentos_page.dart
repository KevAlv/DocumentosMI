import 'package:flutter/material.dart';
import 'package:ml_kit/model/Documents.dart';
import 'package:ml_kit/services/database_services.dart';
import 'document_detail.dart';
import 'document_detailText.dart';

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

//listCardBuilderText
  _selectDocumentText(int ce, int idoc) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => DocumentDetailText(ce, idoc)));
  }

  _selectDocument(int ce, int idoc) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => DocumentDetail(ce, idoc)));
  }

  _getDocuments() {
    Services.getDocuments().then((docs) {
      setState(() {
        _documentos = docs;
      });
    });
  }

  Widget listCard() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _documentos.length,
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          onTap: () {
            _selectDocument(
                _documentos.elementAt(i).id, _documentos.elementAt(i).cod);
          },
          child: Card(
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 19.0 / 10.0,
                  child: Image.network(
                    'https://sitdetecnologia.com/wp-content/uploads/2018/05/FOLDER-TCARTA-UNIDAD-510x540.jpg',
                    // fit: BoxFit.cover,
                  ),
                ),
                _buildTitleSection(_documentos, context, i)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleSection(List<Documento> listaDocumentos,
      [BuildContext context, int i]) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(listaDocumentos.elementAt(i).title,
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          SizedBox(
            height: 10.0,
          ),
          Text('Documento: ' +
              listaDocumentos.elementAt(i).id.toString() +
              ' ' +
              'Expediente: ' +
              listaDocumentos.elementAt(i).cod.toString()),
          Row(
            children: <Widget>[
              Icon(Icons.folder_open),
              SizedBox(
                width: 5.0,
              ),
              Text(listaDocumentos.elementAt(i).fecha)
            ],
          )
        ],
      ),
    );
  }

  Widget bodyData() => DataTable(
      columnSpacing: 6.0,
      columns: <DataColumn>[
        DataColumn(
          onSort: (i, b) {},
          label: Text("Exp#",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
        ),
        DataColumn(
          onSort: (i, b) {},
          label: Text("Doc#",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
        ),
        DataColumn(
          label: Text("Fecha",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          numeric: true,
        ),
        DataColumn(
          label: Text("Nombre",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          numeric: true,
          onSort: (i, b) {},
        ),
      ],
      rows: _documentos
          .map((documentonro) => DataRow(cells: [
                DataCell(Text(documentonro.cod.toString()), onTap: () {
                  _selectDocument(documentonro.id, documentonro.cod);
                }),
                DataCell(Text(documentonro.id.toString()), onTap: () {
                  _selectDocument(documentonro.id, documentonro.cod);
                }),
                DataCell(Text(documentonro.fecha), onTap: () {
                  _selectDocument(documentonro.id, documentonro.cod);
                }),
                DataCell(Text(documentonro.title), onTap: () {
                  _selectDocumentText(documentonro.id, documentonro.cod);
                }),
              ]))
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expedientes'),
      ),
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
