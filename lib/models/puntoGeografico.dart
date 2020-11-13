class PuntoGeografico{
  double _latitud;
  double _longitud;

   PuntoGeografico.fromJson(Map<String, dynamic> parsedJson) {
    //Constructor con Json
    this._latitud = parsedJson['latitud'];
    this._longitud = parsedJson['longitud'];
  }
  //Getters
  double get latitud => this._latitud;
  double get longitud => this._longitud;

  //Setters
  set latitud(double latitud) => this._latitud = latitud;
  set longitud(double longitud) => this._longitud = longitud;
}