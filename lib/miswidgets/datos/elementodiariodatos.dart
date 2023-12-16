
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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