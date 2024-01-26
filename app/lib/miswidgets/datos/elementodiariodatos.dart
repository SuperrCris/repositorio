
import 'package:flutter/material.dart';


class Elementodatos  {
String nombre;
FileImage foto;

Elementodatos(this.nombre, this.foto);

String obtenerNombre(){
  return nombre;
}

FileImage obtenerFoto(){
  return foto;
}

}