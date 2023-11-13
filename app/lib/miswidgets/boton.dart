         
import 'package:flutter/material.dart';

Widget boton(){
           return ElevatedButton(
            child: Text("Iniciar sesión"),
            onPressed: () => print("object"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: const StadiumBorder(),
              minimumSize: Size.fromHeight(60),
             elevation: 10,
),
            );
             }