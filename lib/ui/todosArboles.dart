import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movelo/Api/apiResponse.dart';
import 'package:movelo/blocs/bloc.dart';
import 'package:movelo/models/arbol.dart';
import 'package:movelo/providers/estadoGlobal.dart';
import 'package:provider/provider.dart';

class ArbolesList {
  ArbolesList();

  Bloc bloc = new Bloc();

  Widget buildList(
      AsyncSnapshot<ApiResponse<ArbolModel>> snapshot, BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: snapshot.data.data.arboles
          .length, //El programa tiene que saber cuantos items ha de mostrar en la lista
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 5, bottom: 5, left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 3.0),
            ],
          ),
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 0,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://images.unsplash.com/photo-1513836279014-a89f7a76ae86?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                          imageBuilder: (context, imageProvider) => Container(
                            width: 55.0,
                            height: 55.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        snapshot.data.data.arboles[index].nombre,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
