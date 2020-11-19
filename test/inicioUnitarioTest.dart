// Import the test package and Counter class
import 'package:test/test.dart';
import 'package:movelo/resources/usuario_red.dart';

void main() {
  test('El proveedor debería llamar al método', () {
    final proveedor = ProveedorUser();

    proveedor.iniciarSesion("juanito@gmail.com", "12345678");

    expect(proveedor.variable, true);
  });
}