import 'package:flutter/material.dart';
import 'package:movelo/ui/constantes.dart';

class InfoCardRestantes extends StatelessWidget {
  final String titulo;
  final double dato;
  final String unidades;
  final IconData icono;
  final Color color;
  InfoCardRestantes(
      {this.titulo, this.dato, this.unidades, this.icono, this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return Container(
        padding: EdgeInsets.only(left: 0),
        width: constrains.maxWidth / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 28,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Text(
                  dato.toStringAsFixed(2) + unidades,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.black38, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
