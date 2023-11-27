import 'package:flutter/material.dart';

class Datos extends StatelessWidget{
  String? texto;
  IconData? icono;
  Datos({super.key,this.texto,this.icono});
  @override

  Widget build(BuildContext context) {
return Row(
children:[Icon(icono),Text("$texto",)]
);  }
}