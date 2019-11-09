import 'dart:convert';
import 'package:http/http.dart' as  http;
import 'package:ml_kit/model/Documents.dart';
import 'package:ml_kit/model/Fojas.dart';



class Services{
  static const ROOT='http://192.168.0.15/my_store/Document_actions.php';
  // static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _GET_ALL_DOCUMENTS_ACTION = 'GET_ALL_DOCUMENTS';
  // static const _ADD_EMP_ACTION = 'ADD_EMP';
  // static const _UPDATE_EMP_ACTION = 'UPDATE_EMP';
  // static const _DELETE_EMP_ACTION = 'DELETE_EMP';

  static Future<List<Documento>> getDocuments() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_DOCUMENTS_ACTION;
      final response = await http.post(ROOT, body: map);
      if (200 == response.statusCode) {
        List<Documento> list = parseResponseDocumets(response.body);
        return list;
      } else {
        return List<Documento>();
      }
    } catch (e) {
      return List<Documento>(); // return an empty list on exception/error
    }
  }




  static List<Documento> parseResponseDocumets(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    print(parsed.toString());
    return parsed.map<Documento>((json) => Documento.fromJson(json)).toList();
  }





  // Method to create the table Fojas.

  static Future<List<Foja>> getFojas() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      if (200 == response.statusCode) {
        List<Foja> list = parseResponse(response.body);
        return list;
      } else {
        return List<Foja>();
      }
    } catch (e) {
      return List<Foja>(); // return an empty list on exception/error
    }
  }

 
  static List<Foja> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    print(parsed.toString());
    return parsed.map<Foja>((json) => Foja.fromJson(json)).toList();
  }
 

 }