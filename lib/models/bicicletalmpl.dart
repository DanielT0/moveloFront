import 'package:movelo/models/interfaces/bicicleta.dart';

class Bicicletalmpl extends Bicicleta{
  String _serial;
  String _marca;
  String _color;

  Bicicletalmpl(this._serial, this._marca, this._color); //Constructor

  Bicicletalmpl.fromJson(Map<String, dynamic> parsedJson) {
    //Constructor con Json
    this._serial = parsedJson['serial'];
    this._marca = parsedJson['marca'];
    this._color = parsedJson['color'];
  }
  //Getters
  String get serial => this._serial;
  String get marca => this._marca;
  String get color => this._color;

  //Setters
  set serial(String serial) => this._serial = serial;
  set marca(String marca) => this._marca = marca;
  set color(String color) => this._color = color;

  String mostrarInformacion(){ return " Serial: $serial, Marca: $marca, Color: $color";}
}