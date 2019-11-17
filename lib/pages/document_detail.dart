import 'package:flutter/material.dart';
import 'package:ml_kit/common/session_global.dart';
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

  Widget scrollWidget() {
    return GestureDetector(
      child: listCardBuilder(),
    );
  }

  Widget listCardBuilder() {
    return ListView.builder(
      itemCount: _fojasSelected.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Image(
            image: NetworkImage(
                URL_HOST + 'uploads/' + _fojasSelected.elementAt(index).image),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Documento: ' + widget.idDocumento.toString()),
        ),
        body: GestureDetector(
          // onTap:
          child: scrollWidget(),
        ));
  }
}
