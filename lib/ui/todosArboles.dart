import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movelo/Api/apiResponse.dart';
import 'package:movelo/blocs/bloc.dart';
import 'package:movelo/models/arbol.dart';
import 'package:movelo/providers/estadoGlobal.dart';
import 'package:movelo/ui/widgets/actionCard.dart';
import 'package:provider/provider.dart';

class ArbolesList {
  ArbolesList();

  Bloc bloc = new Bloc();

  Widget buildList(
      AsyncSnapshot<ApiResponse<ArbolModel>> snapshot, BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: snapshot.data.data.arboles
          .length, //El programa tiene que saber cuantos items ha de mostrar en la lista
      itemBuilder: (BuildContext context, int index) {
        return ActionCard(
          width: 600,
          foto: "assets/tree.jpg",
          accion: snapshot.data.data.arboles[index].nombre,
          subaction: snapshot.data.data.arboles[index].nombreCientifico,
        );
      },
    );
  }
}
