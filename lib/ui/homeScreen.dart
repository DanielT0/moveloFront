import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movelo/blocs/bloc.dart';
import 'package:movelo/models/arbol.dart';
import 'package:movelo/providers/estadoGlobal.dart';
import 'package:movelo/ui/constantes.dart';
import 'package:movelo/ui/widgets/actionCard.dart';
import 'package:movelo/ui/widgets/infoCard.dart';
import 'package:movelo/ui/widgets/infoCardNumbers.dart';
import 'package:movelo/ui/widgets/lineChart.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EstadoGlobal proveedor;
  Bloc bloc = new Bloc();
  List<Arbol> arbolesUsuario = [];
  double numArbolesUsuario = 0;
  void irAHome() {
    Navigator.pushNamed(context, '/Maps');
  }

  @override
  void initState() {
    super.initState();
    this.bloc.obtenerTodosArboles(context);
    Timer.run(() {
      bloc.arboles.map((object) => object.data.arboles).listen((p) {
        print("sdud");
        // Escuchamos al stream (que no dará dato a dato el conjunto)
        setState(() => arbolesUsuario = p); //Le asignamos el conjunto a ligas
        print(arbolesUsuario.length);
        proveedor.arbolesUsuario = arbolesUsuario;
        for (var i = 0; i < arbolesUsuario.length; i++) {
          if (proveedor.metaArbol < arbolesUsuario[i].precio)
            proveedor.metaArbol = arbolesUsuario[i].precio;
          print(proveedor.metaArbol);
          break;
        }
        numArbolesUsuario = arbolesUsuario.length == null
            ? 0
            : arbolesUsuario.length.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<EstadoGlobal>(context, listen: false);
    proveedor = myProvider;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 20, bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.03),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Wrap(
              runSpacing: 20,
              spacing: 10,
              children: [
                InfoCardNumbers(
                  titulo: "Árboles plantados",
                  dato: 0, // numArbolesUsuario,
                  unidades: "árboles",
                  icono: Icons.nature,
                  color: Colors.green,
                ),
                InfoCardNumbers(
                  titulo: "Huella de carbono",
                  dato:
                      0, //myProvider.biciusuarioUser.huellaCarbonoAcumulada ==null ? 0 :myProvider.biciusuarioUser.huellaCarbonoAcumulada ,
                  unidades: "ton",
                  icono: Icons.fingerprint,
                  color: Colors.purple,
                ),
                InfoCard(
                  titulo: "Kilómetros recorridos",
                  dato: 0, //myProvider.biciusuarioUser.metrosRecorridos == null
                  //? 0
                  //: myProvider.biciusuarioUser.metrosRecorridos.toDouble(),
                  unidades: "km",
                  icono: Icons.directions_run,
                  color: Color(0xFFFF9C00),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "Acciones",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: height / 2.8,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ActionCard(
                        width: width,
                        foto: "assets/bycicle.jpg",
                        accion: "Ir a mapa",
                        subaction: "Navega en tu ciudad",
                        funcion:()=> Navigator.pushNamed(context, '/Maps'),
                      ),
                      ActionCard(
                        width: width,
                        foto: "assets/trees.jpg",
                        accion: "Ver árboles",
                        subaction: "Observa lo que has plantado",
                        funcion: ()=> Navigator.pushNamed(context, '/Arboles'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Container(
          child: Icon(
            Icons.menu,
            color: kPrimaryColor,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: kPrimaryColor,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

class OptionButton extends StatelessWidget {
  final String svg;
  final String texto;
  const OptionButton({Key key, this.svg, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          child: SvgPicture.asset("$svg"),
        ),
        Text(
          "$texto",
          style: Theme.of(context).textTheme.bodyText2.copyWith(),
        ),
      ],
    );
  }
}
