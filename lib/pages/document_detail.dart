import 'package:flutter/material.dart';
import 'package:ml_kit/model/Fojas.dart';
import 'package:ml_kit/services/database_services.dart';

class DocumentDetail extends StatefulWidget {
  final int codExpediente;
  final int idDocumento;
  DocumentDetail(this.idDocumento,this.codExpediente);
  
  @override
  _DocumentDetailState createState() => _DocumentDetailState();
}

class _DocumentDetailState extends State<DocumentDetail> {
   List<Foja> _fojasSelected;
@override
  void initState() {
      int ce=widget.codExpediente;
    int idoc=widget.idDocumento;
    _fojasSelected=[];
    _getFojas(ce,idoc);
    super.initState();
  }

    _getFojas(int ce,int id) {
    Services.getSelectedFojas(ce,id).then((pages) {
      setState(() {
        _fojasSelected = pages;
      });
    
    });
  }


Widget imageList(){
  return Column(
    children: <Widget>[
        Image.network('http://192.168.0.15/my_store/uploads/'+_fojasSelected.elementAt(0).image)
    ],
  );
}
 Widget bodyDataDetail() => DataTable(
   columnSpacing: 4.0,

          columns: <DataColumn>[

            DataColumn(
              onSort: (i, b) {},
                label: Text("Page"),
                ),
            DataColumn(
                label: Text("Image"),
                numeric: true,
                ),
                    DataColumn(
                label: Text("Expediente"),
                numeric: true,
                onSort: (i, b) {},
                ),
          ],
          rows: _fojasSelected
              .map((fojasSelected) => DataRow(cells: [
                    DataCell(Text(fojasSelected.pagina.toString())),
                    DataCell(Text(fojasSelected.image) ),
                    DataCell(Text(fojasSelected.contenido)),
                  ]))
              .toList());


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: Text('Documento: '+widget.idDocumento.toString()),),
         body:SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: bodyDataDetail(),
         ),
       ),
    
    );
  }
}