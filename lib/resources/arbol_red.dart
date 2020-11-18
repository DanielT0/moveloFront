import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:movelo/models/arbol.dart';
import 'dart:convert';

// Clase para gestionar (hacer operaciones CRUD) de datos en la base de datos, comunicandose con el servidor

class ProveedorArboles {
  Future<ArbolModel> obtenerArbolesUsuario(String correo) async {
    var resp;
    var tagObjsJson;
    http.Response response = await http.get(
        'https://bf0d59226f31.ngrok.io/api/arboles?email=$correo');
    print(response.body);
    print("hoooola");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      if (json.decode(response.body) == false) {
        resp = null;
      } else
      resp = ArbolModel.fromJson(json.decode(response.body));
      //tagObjsJson = jsonDecode(response.body)['arboles'] as List;
      //List<Arbol> tagObjs = tagObjsJson.map((tagJson) => Arbol(tagJson)).toList();
      //ArbolModel arboles = new ArbolModel(tagObjs);
      //resp = arboles;
      return resp;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<ArbolModel> obtenerTodosArboles() async {
    var resp;
    http.Response response =
        await http.get('https://bf0d59226f31.ngrok.io/api/arboles/todos');
    print(response.body);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      if (json.decode(response.body) == false) {
        resp = null;
      } else
        resp = ArbolModel.fromJson(json.decode(response.body));
      return resp;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
