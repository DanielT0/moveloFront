import 'package:movelo/models/interfaces/bicicleta.dart';
import 'package:movelo/models/interfaces/componentes.dart';
import 'package:movelo/models/puntoGeografico.dart';
import 'package:movelo/models/user.dart';

class Biciusuario extends Componente implements User{
  int _id;
  String _cc;
  String _correo;
  String _password;
  String _tipo;
  List<Bicicleta> _bicicletas;
  String _nombre;
  String _direccion;
  String _telefono;
  double _huellaCarbonoAcumulada;
  List<PuntoGeografico> _arbolesContribuidos;
  int _metrosNoPlantados;
  int _metrosRecorridos;

  Biciusuario(this._id, this._cc, this._correo, this._password, this._tipo, this._nombre, this._direccion, this._telefono,
      this._huellaCarbonoAcumulada, this._metrosNoPlantados, this._metrosRecorridos); //Constructor

  Biciusuario.fromJson(Map<String, dynamic> parsedJson) {
    //Constructor con Json
    this._id = parsedJson['id'];
    this._cc = parsedJson['cc'];
    this._nombre = parsedJson['nombre'];
    this._correo= parsedJson['correo'];
    this._password= parsedJson['password'];
    this._tipo= parsedJson['tipo'];
    this._direccion = parsedJson['direccion'];
    this._telefono = parsedJson['telefono'];
    this._huellaCarbonoAcumulada = parsedJson['huellaCarbonoAcumulada'];
    this._metrosNoPlantados = parsedJson['metrosNoPlantados'];
    this._metrosRecorridos = parsedJson['kmRecorridos'];
  }
  //Getters
  int get id => this._id;
  String get cc => this._cc;
  String get nombre => this._nombre;
  String get correo => this._correo;
  String get password => this._password;
  String get tipo => this._tipo;
  String get direccion => this._direccion;
  String get telefono => this._telefono;
  double get huellaCarbonoAcumulada => this._huellaCarbonoAcumulada;
  int get metrosNoPlantados => this._metrosNoPlantados;
  int get metrosRecorridos => this._metrosRecorridos;
  List<PuntoGeografico> get arbolesContribuidos => this._arbolesContribuidos;
  List<Bicicleta> get bicicletas => this._bicicletas;

  //Setters
  set id(int id) => this._id = id;
  set cedula(String cc) => this._cc = cc;
  set nombre(String nombre) => this._nombre = nombre;
  set correo(String correo) => this._correo= correo;
  set password(String password) => this._password;
  set tipo(String tipo) => this._tipo;
  set direccion(String direccion) => this._direccion = direccion;
  set telefono(String telefono) => this._telefono = telefono;
  set huellaCarbonoAcumulada(double huellaCarbonoAcumulada) => this._huellaCarbonoAcumulada = huellaCarbonoAcumulada;
  set metrosNoPlantados(int metrosNoPLantados) => this._metrosNoPlantados = metrosNoPLantados;
  set metrosRecorridos(int metrosRecorridos) => this._metrosRecorridos = metrosRecorridos;

  void addBicicleta(Bicicleta bicicleta){
    this._bicicletas.add(bicicleta);
  }

  void addArbol(PuntoGeografico punto){
    this._arbolesContribuidos.add(punto);
  }

  void mostrarInformacion()=>{};
}
