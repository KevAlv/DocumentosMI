import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:ml_kit/common/session_global.dart';
import 'package:ml_kit/services/upload_image_service.dart';

class PhotoPicker extends StatefulWidget {
  PhotoPicker({Key key}) : super(key: key);

  @override
  _PhotoPickerState createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  File _image;
List<String> lista = ['1', '2', '3', '4'];
List<String> lista2 = ['1', '2', '3', '4'];
int expediente;
int documento;
Widget dropDownSelectExpediente() {
  return DropdownButton<String>(
    items: lista.map((String value) {
      expediente = int.parse(value);
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text('Expediente: ' + value),
      );
    }).toList(),
    onChanged: (_) {
     
    },
  );
}

Widget dropDownSelectDocumento() {
  return DropdownButton<String>(
    items: lista2.map((String value) {
      documento = int.parse(value);
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text('Documento: ' + value),
      );
    }).toList(),
    onChanged: (_) {
      
    },
  );
}

Widget rowWidgetFilter() {
  return Center(
      child: Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Id Documento'),
          Text('Cod Expediente '),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          dropDownSelectDocumento(),
          dropDownSelectExpediente(),
        ],
      ),
    ],
  ));
}


  Future getImage() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    } catch (e) {
      print('no image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tomar Foto"),
      ),
      body: ListView(
        children: <Widget>[
          rowWidgetFilter(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: _image == null
                ? new Column(children: <Widget>[
                    Image.network(
                      'https://static.thenounproject.com/png/1174579-200.png',
                      height: 300,
                    )
                  ])
                : Image.file(_image),
          ),
          FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Escoge una imagen',
            child: Icon(Icons.add_photo_alternate),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          upload(_image, idDocumentoGlobal, codExpedienteGlobal);
        },
        tooltip: 'Escoge una imagen',
        child: Icon(Icons.archive),
      ),
    );
  }
}
