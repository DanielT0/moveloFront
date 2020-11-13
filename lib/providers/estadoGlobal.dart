import 'package:flutter/foundation.dart';
import 'package:movelo/models/biciusuario.dart';
import 'package:movelo/models/empresa.dart';

class EstadoGlobal with ChangeNotifier {
//Creamos una claSe "EstadoGlobal" y le agregamos las capacidades de Change Notifier.
  Biciusuario
      _userBiciusuario; //Objeto que representa al jugador que ha iniciado sesión
  Empresa _userEmpresa; //Objeto que representa al admin que ha iniciado sesión
  String _tipo; // Sabremos el tipo de usuario que es
  bool _errorServidor =
      false; //True si existe un error de servidor, false si no

  String get tipo => _tipo; //Con él sabremos qué tipo de usuario está navegando

  set tipo(String tipo) {
    _tipo = tipo;
    notifyListeners();
  }

  Biciusuario get biciusuarioUser => _userBiciusuario;

  set biciusuarioUser(Biciusuario newBiciusuario) {
    _userBiciusuario = newBiciusuario;
    notifyListeners();
  }

  Empresa get empresaUser => _userEmpresa;

  set empresaUser(Empresa newEmpresa) {
    _userEmpresa = newEmpresa;
    notifyListeners();
  }

  int _usuario; //Dentro de nuestro provider, creamos e inicializamos nuestra variable. En este caso un int correspondiente a la cédula del usuario que está activo
  int get usuario =>
      _usuario; //Creamos el método Get, para poder obtener el valor de mitexto
//Ahora creamos el método set para poder actualizar el valor de _mitexto, este método recibe un valor newTexto de tipo String
  set usuario(int newUsuario) {
    _usuario = newUsuario; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }

  bool get errorServidor => _errorServidor;

  set errorServidor(bool error) {
    _errorServidor = error;
    notifyListeners();
  }
}
