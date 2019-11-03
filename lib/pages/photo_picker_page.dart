import 'dart:io';

import 'package:fit_image/fit_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:ml_kit/services/mlkit_services.dart';

class PhotoPicker extends StatefulWidget {
  PhotoPicker({Key key}) : super(key: key);

  @override
  _PhotoPickerState createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
    File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : new SizedBox(
                    width: 200,
                    height: 350,
                    child: new FitImage(
                      child: Image.file(_image),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
            FloatingActionButton(
              onPressed: getImage,
              tooltip: 'Escoge una imagen',
              child: Icon(Icons.add_photo_alternate),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){readText(_image);} ,
        tooltip: 'Escoge una imagen',
        //este es el boton para subir la imagen, funciona desde la consolag
        child: Icon(Icons.archive),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}