           
           import 'package:flutter/material.dart';

// ignore: must_be_immutable
class miBoton extends StatelessWidget{
         BuildContext contexto;
         dynamic ruta;
       miBoton({super.key, required this.contexto,required this.ruta});
            
              @override
              Widget build(BuildContext context) {
                return   ElevatedButton(
                  style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: const StadiumBorder(),
              minimumSize: Size.fromHeight(60),
             elevation: 10,
),
            child: Text("Iniciar sesión"),
            onPressed: () => 
            Navigator.push(
              context, 
            MaterialPageRoute(
              builder: (context) => ruta),
),
             ); }
              }