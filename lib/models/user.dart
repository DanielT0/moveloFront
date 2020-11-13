
class User {
  int _id;
  String _correo;
  String _password;
  String _tipo;

  User(this._id, this._correo,  this._password, this._tipo); //Constructor

  User.fromJson(Map<String, dynamic> parsedJson) {
    //Constructor con Json
    this._id = parsedJson['idUsuario'];
    this._correo = parsedJson['Correo'];
    this._password = parsedJson['Password'];
    this._tipo = parsedJson['Tipo'];
  }
  //Getters
  int get id => this._id;
  String get correo => this._correo;
  String get password => this._password;
  String get tipo => this._tipo;

  //Setters
  set id(int id) => this._id = id;
  set correo(String correo) => this._correo = correo;
  set password(String password) => this._password = password;
  set tipo(String tipo) => this._tipo = tipo;
}
