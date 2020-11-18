import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:movelo/models/biciusuario.dart';
import 'dart:convert';

import 'package:movelo/models/registroGeografico.dart';

// Clase para gestionar (hacer operaciones CRUD) de datos en la base de datos, comunicandose con el servidor

class ProveedorBiciusuarios {
  Future<bool> anadirBiciusuario(Biciusuario biciusuario) async {
    var admin;
    //Y aquí nos comunicamos con la base de datos
    http.Response response = await http.post(
        //Usamos la extensión http de dart, que nos permite hacer posts y gets en el servidor
        'https://bf0d59226f31.ngrok.io/api/bikeriders', //Insertamos el url de donde está la interacción con la base de datos (los insert, delete), o stored procedures
        body: jsonEncode(
          {
            //En el caso de post, al utilizar php, asignamos los datos que se necesitan para hacer la transacción con la base de datos
            "correo": biciusuario.correo,
            "cc": biciusuario.cc,
            "nombre": biciusuario.nombre,
            "direccion": biciusuario.direccion,
            "password": biciusuario.password,
            "telefono": biciusuario.telefono,
          },
        ),
        headers: {"Content-Type": "application/json"});
    String body = response
        .body; //Almacenamos la respuesta que se nos de en body (normalmente en php se maneja con un "echo")
    print(body);
    if (response.statusCode == 201) {
      //statusCode!= 200... Hubo un error :c
      if (json.decode(response.body) == false) {
        return null;
      } else {
        admin = true;
        return admin;
      } // Si el sistema llega hasta acá, bien, se comunicó con el servidor, este devolverá un error o nada(no hubo errores), pero eso ya depende del código de acceso a la bd (puro php y mysql)
    }
    if (response.statusCode == 409) {
      return null;
    } else {
      throw Exception('Error al conectar con el servidor');
    }
  }

  Future<bool> enviarRegistrosRuta(List<Registro> registros) async {
    
    var jso = jsonEncode(registros.map((e) => e.toJson()).toList());
    http.Response response = await http.post(
        //Usamos la extensión http de dart, que nos permite hacer posts y gets en el servidor
        'https://bf0d59226f31.ngrok.io/api/routes', //Insertamos el url de donde está la interacción con la base de datos (los insert, delete), o stored procedures
        body: jso,
        headers: {"Content-Type": "application/json"});
    String body = response
        .body; //Almacenamos la respuesta que se nos de en body (normalmente en php se maneja con un "echo")
    print(body);
    if (response.statusCode == 201) {
      //statusCode!= 200... Hubo un error :c
      if (json.decode(response.body) == false) {
        return false;
      } else {
        return true;
      } // Si el sistema llega hasta acá, bien, se comunicó con el servidor, este devolverá un error o nada(no hubo errores), pero eso ya depende del código de acceso a la bd (puro php y mysql)
    }
    if (response.statusCode == 409) {
      return null;
    } else {
      throw Exception('Error al conectar con el servidor');
    }
  }
}
