import 'package:movelo/models/interfaces/bicicleta.dart';
import 'package:movelo/models/interfaces/componentes.dart';
import 'package:movelo/models/puntoGeografico.dart';
import 'package:movelo/models/user.dart';

class Empresa extends Componente{
  String _nit;
  List<Componente> _componente;
  String _nombre;
  String _direccion;
  String _telefono;

  Empresa(this._nit, this._nombre, this._direccion, this._telefono); //Constructor

  Empresa.fromJson(Map<String, dynamic> parsedJson) {
    //Constructor con Json
    this._nit = parsedJson['NIT'];
    this._nombre = parsedJson['Nombre'];
    this._direccion = parsedJson['Direccion'];
    this._telefono = parsedJson['Telefono'];
  }
  //Getters
  String get nit => this._nit;
  String get nombre => this._nombre;
  String get direccion => this._direccion;
  String get telefono => this._telefono;

  //Setters
  set nit(String nit) => this._nit= nit;
  set nombre(String nombre) => this._nombre = nombre;
  set direccion(String direccion) => this._direccion = direccion;
  set telefono(String telefono) => this._telefono = telefono;

  void mostrarInformacion()=>{};
}
