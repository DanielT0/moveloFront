class RegistroModel {
  List<Registro> _registros= [];
  double totalDistance;

  RegistroModel(this._registros, this.totalDistance);
  
  RegistroModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['registros'].length);
    List<Registro> temp = [];
    for (int i = 0; i < parsedJson['registros'].length; i++) {
      Registro registro = Registro.fromJsonn(parsedJson['registro'][i]);
      temp.add(registro);
    }
    _registros = temp;
  }

  List<Registro> get registros=> _registros;
}


class Registro {
  double _long;
  double _lat;
  String _time;

  Registro(this._long, this._lat, this._time); //Constructor

  Registro.fromJson(Map<String, dynamic> parsedJson) {
    //Constructor con Json
    this._lat = parsedJson['latitude'];
    this._long = parsedJson['longitude'];
    this._time = parsedJson['timeStamp'];
  }

  Registro.fromJsonn(resultado){
    this._lat=resultado['latitude'];
    this._long= resultado['longitude'];
    this._time = resultado['timeStamp'];
  } //Constructor

  Map toJson() => {
        'latitude': _lat,
        'longitude': _long,
        'timeStamp': _time,
      };

  Map<String, dynamic> toJsonAttr() => {
        'latitude': _lat,
        'longitude': _long,
        'timeStamp': _time,
      };

  //Getters
  double get latitud => this._lat;
  double get longitud => this._long;
  String get time => this._time;

  //Setters
  set latitud(double latitud) => this._lat = latitud;
  set longitud(double longitud) => this._long = longitud;
  set time(String date) => this._time = date;
}
