import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ml_kit/model/Documents.dart';
import 'package:ml_kit/model/Fojas.dart';

class Services {
  static const ROOT =
      'http://192.168.0.15/SistemaAbogados/Document_actions.php';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _GET_ALL_DOCUMENTS_ACTION = 'GET_ALL_DOCUMENTS';

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

  static Future<List<Foja>> searchFojas(String word,
      [int idDoc, int codExpediente]) async {
    try {
      int i = 0;
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      List<Foja> list = parseResponse(response.body);
      List<Foja> selectedFojas = [];
      if (200 == response.statusCode) {
        if ((idDoc != null) || (codExpediente != null)) {
          //si me pasan valores

          if ((idDoc != null) && (codExpediente != null)) {
            while (list.length > i) {
              if ((list.elementAt(i).idDocumento == idDoc) &&
                  (list.elementAt(i).codExpediente == codExpediente)) {
                if (list.elementAt(i).contenido.contains(word)) {
                  selectedFojas.add(list.elementAt(i));
                }
              }
              i++;
            }
          }
//si solo me pasan el idDoc
          if ((idDoc != null) && (codExpediente == null)) {
            while (list.length > i) {
              if ((list.elementAt(i).idDocumento == idDoc)) {
                if (list.elementAt(i).contenido.contains(word)) {
                  selectedFojas.add(list.elementAt(i));
                }
              }
              i++;
            }
          }
//si solo me pasan el codexpediente
          if ((idDoc == null) && (codExpediente != null)) {
            while (list.length > i) {
              if ((list.elementAt(i).codExpediente == codExpediente)) {
                if (list.elementAt(i).contenido.contains(word)) {
                  selectedFojas.add(list.elementAt(i));
                }
              }
              i++;
            }
          }
        } else {
          while (list.length > i) {
            if (list.elementAt(i).contenido.contains(word)) {
              selectedFojas.add(list.elementAt(i));
            }

            i++;
          }
        }

        return selectedFojas;
      } else {
        return List<Foja>();
      }
    } catch (e) {
      return List<Foja>(); // return an empty list on exception/error
    }
  }

  static Future<List<Foja>> getSelectedFojas(int ce, int id) async {
    try {
      int i = 0;
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      if (200 == response.statusCode) {
        List<Foja> list = parseResponse(response.body);
        List<Foja> selectedFojas = [];
        while (list.length > i) {
          if ((list.elementAt(i).codExpediente == ce) &&
              (list.elementAt(i).idDocumento == id)) {
            selectedFojas.add(list.elementAt(i));
          }
          i++;
        }
        //lines before here is not runnings
        return selectedFojas;
      } else {
        return List<Foja>();
      }
    } catch (e) {
      return List<Foja>(); // return an empty list on exception/error
    }
  }

  static List<Foja> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Foja>((json) => Foja.fromJson(json)).toList();
  }
}
