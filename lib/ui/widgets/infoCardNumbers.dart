import 'package:flutter/material.dart';
import 'package:movelo/ui/constantes.dart';

class InfoCardNumbers extends StatelessWidget {
  final String titulo;
  final double dato;
  final String unidades;
  final IconData icono;
  final Color color;
  InfoCardNumbers(
      {this.titulo, this.dato, this.unidades, this.icono, this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return Container(
        width: constrains.maxWidth / 2 - 5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: this.color.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      this.icono,
                      size: 16,
                      color: this.color,
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.29,
                    child: Text(
                      "$titulo",
                      maxLines: 1,
                      style: TextStyle(fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
