import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:ml_kit/services/upload_image_service.dart';

class PhotoPicker extends StatefulWidget {
  PhotoPicker({Key key}) : super(key: key);

  @override
  _PhotoPickerState createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  File _image;
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
 
      body: ListView(
        children: <Widget>[
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
        onPressed: ()
        
         {
           upload(_image);
          // readText(_image);
        },
        tooltip: 'Escoge una imagen',
        //este es el boton para subir la imagen, funciona desde la consolag
        child: Icon(Icons.archive),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
