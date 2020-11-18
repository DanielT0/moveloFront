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
