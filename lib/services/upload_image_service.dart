import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

Future upload(File imageFile) async {
  var stream= new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length= await imageFile.length();
  var uri = Uri.parse("http://192.168.0.15/my_store/upload.php");
  var request = new http.MultipartRequest("POST", uri);

  var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imageFile.path)); 
  request.fields['title'] = 'Prueba1';
  request.files.add(multipartFile); 
  var response = await request.send();
  if(response.statusCode==200){
    print("Image Uploaded");
  }else{
    print("Upload Failed");
  }
  response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
}


