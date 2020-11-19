import 'package:flutter/material.dart';
import 'package:movelo/Api/apiResponse.dart';
import 'package:movelo/blocs/bloc.dart';
import 'package:movelo/models/arbol.dart';
import 'package:movelo/providers/estadoGlobal.dart';
import 'package:movelo/ui/todosArboles.dart';
import 'package:movelo/ui/widgets/alert.dart';
import 'package:provider/provider.dart';

class ArbolesUsuario extends StatefulWidget {
  @override
  _ArbolesUsuarioState createState() => _ArbolesUsuarioState();
}

class _ArbolesUsuarioState extends State<ArbolesUsuario> {
  Bloc bloc = new Bloc();
  EstadoGlobal proveedor;
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<EstadoGlobal>(context, listen: false);
    proveedor = myProvider;
    bloc.obtenerArbolesUser(myProvider.biciusuarioUser.correo);
    return opcionVista();
  }

  Widget opcionVista() {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Árboles del usuario',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: StreamBuilder(
              stream: bloc.arbolesUser,
              builder:
                  (context, AsyncSnapshot<ApiResponse<ArbolModel>> snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case Status.LOADING:
                      return Center(child: CircularProgressIndicator());
                      break;
                    case Status.COMPLETED:
                      ArbolesList arboles = new ArbolesList();
                      return arboles.buildList(snapshot, context);
                      break;
                    case Status.ERROR:
                      return Container();
                  }
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
