import 'package:app/miswidgets/boton.dart';
import 'package:app/miswidgets/entrada_texto.dart';
import 'package:app/miswidgets/entrada_texto_contraseNa.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const InicioSesion());
}

class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MiInicioSesion());
  }
}

class MiInicioSesion extends StatefulWidget {
  const MiInicioSesion({super.key});

  @override
  State<StatefulWidget> createState() {
    return Forma();
  }
}

class Forma extends State<MiInicioSesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height) / 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.green, Color.fromARGB(255, 44, 117, 2)]),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),



          Center(
            child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              SizedBox(
  height: (MediaQuery.sizeOf(context).height)/2.5
  ),     const  Center(
          child: Text("¡Bienvenido!", style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,)),),
           const SizedBox(height: 30,),   
           entradaTexto(),
            const SizedBox(height: 30,), 
           EntradaTextoContrasena(),
        const   SizedBox(height: 50,), 
           boton(),

           ]
         ), ),
     ] 
    ),);
  }
}
