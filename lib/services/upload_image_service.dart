import 'dart:convert';
import 'dart:io';
import 'package:ml_kit/common/session_global.dart';
import 'package:ml_kit/services/mlkit_services.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

Future upload(File imageFile) async {
  var stream= new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length= await imageFile.length();
  var link=linking;
  var uri = Uri.parse(link+"/upload.php");
  var request = new http.MultipartRequest("POST",uri);
  String contenido = await readText(imageFile);
  var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imageFile.path)); 
  
  request.fields['Contenido'] = contenido;
  request.fields['Id_documento'] = '1';
  request.fields['CodExpediente'] = '1';
  request.files.add(multipartFile); 
  
  var response = await request.send();
  if(response.statusCode==200){
    print("Image Uploaded");
      response.stream.transform(utf8.decoder).listen((value) {
    });
  }else{
    print("Upload Failed");
  }

}


