import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

  Future readText(File image) async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(image);
    TextRecognizer recognizedText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizedText.processImage(ourImage);
    //Metodo que manejara la respuesta
    for (TextBlock bloque in readText.blocks) {
      for (TextLine linea in bloque.lines) {
        print(linea.text.split(" "));
      }
    }
  }