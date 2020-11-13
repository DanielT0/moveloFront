import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movelo/models/biciusuario.dart';
import 'package:movelo/models/empresa.dart';
import 'package:movelo/models/user.dart';
import 'package:movelo/providers/estadoGlobal.dart';
import 'package:movelo/resources/respositoryAll.dart';
import 'package:provider/provider.dart';

class Bloc {
  final _repository = RepositoryAll();

  Future iniciarSesion(
      String correo, String contrasena, BuildContext context) async {
    var myProvider = Provider.of<EstadoGlobal>(context, listen: false);
    var respuesta = false;
    User resp = await this.verificaUsuario(correo, contrasena);
    if (resp != null) {
      if (resp is Biciusuario) {
        Biciusuario biciuser = resp;
        myProvider.biciusuarioUser = biciuser;
        myProvider.tipo = "Biciusuario";
        respuesta = true;
      }
    } else {
      respuesta = false;
    }
    return respuesta;
  }

  Future registrarUsuario(Biciusuario biciusuario, BuildContext context) async {
    var myProvider = Provider.of<EstadoGlobal>(context, listen: false);
    var respuesta = false;
    User resp = await this._repository.insertBiciusuario(biciusuario);
    if (resp != null) {
      Biciusuario biciuser = resp;
      myProvider.biciusuarioUser = biciuser;
      myProvider.tipo = "Biciusuario";
      respuesta = true;
    } else {
      respuesta = false;
    }
    return respuesta;
  }

  //Usuario
  Future verificaUsuario(String mail, password) async {
    var user;
    try {
      user = await _repository.iniciarSesion(mail,
          password); // El código es muy parecido, sólo cambian las entidades
    } on Exception {
      throw Exception();
    }
    return user;
  }

  Future getUsuarioCorreo(String correo) async {
    var user;
    try {
      user = await _repository.obtenerUsuarioCorreo(
          correo); // El código es muy parecido, sólo cambian las entidades
    } on Exception {
      throw Exception();
    }
    return user;
  }
}
