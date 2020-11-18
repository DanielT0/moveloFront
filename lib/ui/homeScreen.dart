import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movelo/blocs/bloc.dart';
import 'package:movelo/models/arbol.dart';
import 'package:movelo/providers/estadoGlobal.dart';
import 'package:movelo/ui/constantes.dart';
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
  double numArbolesUsuario =0;
  void irAHome() {
    Navigator.pushNamed(context, '/Maps');
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<EstadoGlobal>(context, listen: false);
    proveedor = myProvider;

    bloc.arbolesUser.map((object) => object.data.arboles).listen((p) {
      // Escuchamos al stream (que no dará dato a dato el conjunto)
      setState(() => arbolesUsuario = p); //Le asignamos el conjunto a ligas
      print(arbolesUsuario);
      print(arbolesUsuario[0].nombre);
      myProvider.arbolesUsuario = arbolesUsuario;
      numArbolesUsuario= arbolesUsuario.length == null ? 0 : arbolesUsuario.length.toDouble();
    });
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
                  dato: 0,// numArbolesUsuario,
                  unidades: "árboles",
                  icono: Icons.nature,
                  color: Colors.green,
                ),
                InfoCardNumbers(
                  titulo: "Huella de carbono",
                  dato: 0, //myProvider.biciusuarioUser.huellaCarbonoAcumulada ==null ? 0 :myProvider.biciusuarioUser.huellaCarbonoAcumulada ,
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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/Arboles');
                      },
                      child: OptionButton(
                        svg: "assets/alarm.svg",
                        texto: "Botón de pánico",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () => irAHome(),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.4,
                            top: 40,
                          ),
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF60BE93), Color(0xFF1B8D59)]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Crear ruta",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 400,
                          width: 150,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: SvgPicture.asset("assets/route.svg"),
                          ),
                        ),
                      ],
                    ),
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
