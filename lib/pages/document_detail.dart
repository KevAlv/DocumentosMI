import 'package:flutter/material.dart';
import 'package:ml_kit/common/list_widget.dart';
import 'package:ml_kit/model/Fojas.dart';
import 'package:ml_kit/services/database_services.dart';

class DocumentDetail extends StatefulWidget {
  final int codExpediente;
  final int idDocumento;
  DocumentDetail(this.idDocumento, this.codExpediente);

  @override
  _DocumentDetailState createState() => _DocumentDetailState();
}

class _DocumentDetailState extends State<DocumentDetail> {
  List<Foja> _fojasSelected;
  @override
  void initState() {
    int ce = widget.codExpediente;
    int idoc = widget.idDocumento;
    _fojasSelected = [];
    _getFojas(ce, idoc);
    super.initState();
  }

  _getFojas(int ce, int id) {
    Services.getSelectedFojas(ce, id).then((pages) {
      setState(() {
        print(pages.length);
        _fojasSelected = pages;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documento: ' + widget.idDocumento.toString()),
      ),
      body: listCardBuilder(_fojasSelected),
    );
  }
}
