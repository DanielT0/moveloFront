import 'package:movelo/models/biciusuario.dart';
import 'package:movelo/models/user.dart';
import 'package:movelo/resources/biciusuario_red.dart';
import 'package:movelo/resources/usuario_red.dart';

class RepositoryAll {
  final gestorUsuarios = new ProveedorUser();
  final gestorBiciusuarios = new ProveedorBiciusuarios();

//Usuario
  Future<User> iniciarSesion(String mail, String password) =>
      gestorUsuarios.iniciarSesion(mail, password);

  Future<User> obtenerUsuarioCorreo(String correo) =>
      gestorUsuarios.obtenerUsuarioCorreo(correo);

  Future insertBiciusuario(Biciusuario biciusuario) {
    //Es algo parecido a lo que hace el bloc, pero sin await, llama directamente a quien interactua con los datos (por lo que interactuan con los datos por medio de la red... llevaran red en el nombre)
    var resp = gestorBiciusuarios.anadirBiciusuario(biciusuario); //Aquí aparecen un tipo de "gestores", los cuales controlan las llamadas, cada uno para una entidad, cuyas clases están en esta misma carpeta, en el archivo con su respectivo nombre
    return resp; //De nuevo, se retorna la repuesta
  }
}
