import 'package:flutter/material.dart';

// ignore: must_be_immutable
class elementoDieta extends StatelessWidget
{
String nombre;

elementoDieta({
  super.key, 
  required this.nombre});
  
  @override
  Widget build(BuildContext context) {
return Padding(
    padding: EdgeInsets.all(5.0),
    child: Container(
      height: 75,
      width: 75,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green),
        child: Center(
          child:Text(nombre)),

    )

);
  }
  





}