import 'package:flutter/material.dart';
import 'package:movelo/providers/estadoGlobal.dart';
import 'package:movelo/ui/home.dart';
import 'package:movelo/ui/homeScreen.dart';
import 'package:movelo/ui/maps.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

/**
 * Y aquí inicia todo... Manejaremos los modelos bloc(para un correcto manejo de datos) y provider (para almacenar los datos del usuario que inicia sesión)
 * Pequeño tour: En el panel de la izquierda pueden ver varias carpetas dentro del archivo lib (que es donde programamos)
 * blocs tendrá los bloc que manejan el estado de la aplicación (controller), que usa a los archivos red (resources)
 * para obtener los datos, models representa a los objetos que manejamos en la app, y ui a los elementos que se presentan al usuario
 * En providers está el estado global, que manejará las variables del usuario que son usadas en distintas interfaces 
*/
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EstadoGlobal(),
      child: MaterialApp(
        title: 'Movelo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Color(0xFF0D8E53),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(), // Iniciamos con Home (ui/screens/home.dart)
          '/Maps': (context) => Maps(),
          '/HomeScreen': (context) => HomeScreen(),
        },
      ),
    );
  }
}