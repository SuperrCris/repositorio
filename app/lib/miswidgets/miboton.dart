           
           import 'package:flutter/material.dart';

// ignore: must_be_immutable
class miBoton extends StatelessWidget {

  dynamic ruta;
  miBoton({super.key, required this.ruta});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape: CircleBorder(),
        minimumSize: Size.fromRadius(30),
        elevation: 10,
      ),
      child:
          const Icon(Icons.arrow_forward_ios),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ruta),
      ),
    );
  }
}
