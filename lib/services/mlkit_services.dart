import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

  Future<String> readText(File image) async {
    String contenido='';
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(image);
    TextRecognizer recognizedText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizedText.processImage(ourImage);
    //Metodo que manejara la respuesta
    for (TextBlock bloque in readText.blocks) {
      for (TextLine linea in bloque.lines) {
       contenido=contenido+linea.text+'\n';
      }
    }
    return contenido;
  }