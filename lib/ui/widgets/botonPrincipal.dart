import 'package:flutter/material.dart';

class BotonPrincipal extends StatefulWidget {
  final String btnText;
  final bool activo;
  final Function funcion;
  BotonPrincipal({this.btnText, this.activo, this.funcion});
  @override
  _BotonPrincipalState createState() => _BotonPrincipalState();
}

class _BotonPrincipalState extends State<BotonPrincipal> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: widget.activo ? widget.funcion : null,
      child: Container(
        decoration: BoxDecoration(
          color: widget.activo ? Color(0xff17183B) : Colors.grey,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            widget.btnText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}