import 'package:flutter/material.dart';


class ActionCard extends StatelessWidget {
  const ActionCard(
      {Key key,
      @required this.width,
      @required this.foto,
      this.accion,
      this.subaction, this.funcion})
      : super(key: key);

  final double width;
  final String accion;
  final String foto;
  final String subaction;
  final Function funcion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funcion,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: 200,
          child: Stack(
            children: [
              Container(
                width: width / 2.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage("$foto"), fit: BoxFit.cover),
                ),
              ),
              Container(
                width: width / 2.2,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.1), Colors.black],
                    begin: FractionalOffset.center,
                    end: FractionalOffset.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$accion",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$subaction",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
