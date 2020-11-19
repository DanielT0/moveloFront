import 'package:flutter/material.dart';
import 'package:movelo/ui/constantes.dart';

class InfoCardNumbersNoIcon extends StatelessWidget {
  final String titulo;
  final double dato;
  final String unidades;
  final IconData icono;
  final Color color;
  InfoCardNumbersNoIcon(
      {this.titulo, this.dato, this.unidades, this.icono, this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return Container(
        padding: EdgeInsets.only(left:20),
        width: constrains.maxWidth / 2 ,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.29,
                    child: Text(
                      "$titulo",
                      maxLines: 1,
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:10.0, left: 10, right: 10),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: kTextColor,
                        ),
                        children: [
                          TextSpan(
                            text: dato.toStringAsFixed(2),
                            style:
                                Theme.of(context).textTheme.headline4.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: this.color
                                    ),
                          ),
                          TextSpan(
                            text: " $unidades",
                          )
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
    });
  }
}
