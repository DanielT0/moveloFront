
class ArbolModel {
  List<Arbol> _arboles = [];

  ArbolModel(this._arboles);
  
  ArbolModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['arboles'].length);
    List<Arbol> temp = [];
    for (int i = 0; i < parsedJson['arboles'].length; i++) {
      Arbol partido = Arbol(parsedJson['arboles'][i]);
      temp.add(partido);
    }
    _arboles = temp;
  }

  List<Arbol> get arboles=> _arboles;
}

class Arbol {
  String _idArbol;
  String _nombre;
  String _nombreCientifico;
  double _precio;

  Arbol(resultado){
    this._idArbol=resultado['idArbol'];
    this._nombre= resultado['nombre'];
    this._nombreCientifico = resultado['nombreCientifi'];
    this._precio = resultado['precio'];
  } //Constructor

 //Getters


  String get idArbol => this._idArbol;
  String get nombre => this._nombre;
  String get nombreCientifico => this._nombreCientifico;
  double get precio => this._precio;

 //Setters
  set idArbol(String idArbol) => this._idArbol = idArbol;
  set nombre (String nombre) => this._nombre = nombre;
  set nombreCientifico (String nombreCientifico) => this._nombreCientifico =nombreCientifico;
  set precio (double precio) => this._precio = precio;
  }