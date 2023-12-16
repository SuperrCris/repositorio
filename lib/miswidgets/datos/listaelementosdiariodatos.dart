import 'dart:io';

import 'package:app/miswidgets/datos/elementodiariodatos.dart';
import 'package:flutter/material.dart';


List<Elementodatos> lista = [];
List<Elementodatos>listadiarios() {
for (var i = 0; i < 5; i++) {
  lista.add(Elementodatos("No hay", FileImage(File ("recursos/ensalada.jpg"))));
}
  return lista;
}