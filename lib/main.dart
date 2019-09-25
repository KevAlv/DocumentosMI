import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:fit_image/fit_image.dart';
import 'package:ml_kit/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  //Metodo que llamara al servicio
  Future readText() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(_image);
    TextRecognizer recognizedText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizedText.processImage(ourImage);
    //Metodo que manejara la respuesta
    for (TextBlock bloque in readText.blocks) {
      for (TextLine linea in bloque.lines) {
        print(linea.text);
      }
    }
  }

//Metodo que manejara el codigo de barras
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
        onPressed: readText,
        tooltip: 'Escoge una imagen',
        child: Icon(Icons.adjust),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
