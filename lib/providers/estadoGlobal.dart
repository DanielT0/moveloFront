import 'package:flutter/foundation.dart';
import 'package:movelo/models/arbol.dart';
import 'package:movelo/models/biciusuario.dart';
import 'package:movelo/models/empresa.dart';
import 'package:movelo/ui/maps.dart';

class EstadoGlobal with ChangeNotifier {
//Creamos una claSe "EstadoGlobal" y le agregamos las capacidades de Change Notifier.
  Biciusuario
      _userBiciusuario; //Objeto que representa al jugador que ha iniciado sesión
  Empresa _userEmpresa; //Objeto que representa al admin que ha iniciado sesión
  String _tipo; // Sabremos el tipo de usuario que es
  double _huellaCarro=404/1.6034;
  double _huellaBici=0.01;
  double _huellaMoto=77.76306;
  double _metaArbol=2;

  double get huellaCarro => _huellaCarro;
  double get huellaBici =>_huellaBici;
  double get huellaMoto => _huellaMoto;
  double get metaArbol => _metaArbol;

  set metaArbol(double metaArbol){
    _metaArbol = metaArbol;
    notifyListeners();
  }


  set huellaCarro(double huella) {
    _huellaCarro = huella;
    notifyListeners();
  }

  set huellaMoto(double huella) {
    _huellaMoto = huella;
    notifyListeners();
  }
  set huellaBici(double huella) {
    _huellaBici = huella;
    notifyListeners();
  }
List<Arbol> _arbolesUsuario; 

  List<Arbol> get arbolesUsuario => _arbolesUsuario;
  set arbolesUsuario(List<Arbol> arboles) {
    _arbolesUsuario=arboles;
    notifyListeners();
  }

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
