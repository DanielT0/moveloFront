import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inputs extends StatelessWidget {
  final TextEditingController
      controller; //Controller del input (quien maneja lo que se ingresa en este)
  final String texto;
  final GlobalKey<FormFieldState> _key;
  final bool
      obscureText; //Usado para contraseñas (true si se quiere que el texto no sea legible)
  final TextInputType keyboard; //Tipo de entrada
  final IconData icon;
  final Function funcion;

  Inputs(this.texto, this.controller, this._key, this.keyboard,
      this.obscureText, this.icon, this.funcion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff17183B),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                child: Icon(
                  this.icon,
                  size: 20,
                  color: Color(0xFFBB9B9B9),
                ),
              ),
              Expanded(
                child: TextFormField(
                  key: this._key,
                  keyboardType: this.keyboard,
                  obscureText: this.obscureText,
                  controller: this.controller,
                  onChanged:(value)=> this.funcion(),
                  validator: (value) {
                    //El validador por el que pusimos el Form, este valida que no hayan espacios vacíos o números y letras en donde no deberían
                    if (value.isEmpty) {
                      return 'Por favor ingresa este dato';
                    }
                    if (keyboard == TextInputType.number) {
                      if (value.contains(new RegExp(r'[A-Z]')) ||
                          value.contains(new RegExp(r'[a-z]'))) {
                        return 'No se permiten letras';
                      } else {
                        return null;
                      }
                    } else if (keyboard == TextInputType.emailAddress) {
                      Pattern pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                      return (regex.hasMatch(value))
                          ? null
                          : 'Por favor ingresa un correo válido';
                    } else if (keyboard == TextInputType.visiblePassword) {
                      if (value.length < 8) {
                        return 'Las contraseñas deben tener mínimo 8 caracteres';
                      }
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintText: this.texto,
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
