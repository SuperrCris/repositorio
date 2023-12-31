import 'dart:io';

import 'package:app/miswidgets/barradatos.dart';
import 'package:app/miswidgets/datos/elementodiariodatos.dart';
import 'package:app/miswidgets/datos/listaelementosdiariodatos.dart';
import 'package:app/miswidgets/datosprogresoinicial.dart';
import 'package:app/miswidgets/estilos/textos.dart';
import 'package:app/ventanas/botshe_nuevo.dart';
import 'package:flutter/material.dart';


List<Elementodatos> listadiario = listadiarios();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: "Si",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xffd1e0d2), Color(0xffc9eed5)],
          stops: [0.25, 0.75],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(children: [
              Text("Bienvenido, Cris.",
                  style: TextStyle(
                    fontFamily: 'figtree',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              Expanded(child: SizedBox())
            ]),
          ),
          const SizedBox(
            height: 25,
          ),
          Barradatos(),
          SizedBox(height: 25),
          //   miBoton(titulo:"Mis comidas", icono:Icons.dining),
          Container(
              padding: EdgeInsets.only(top: 15,bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(90),
                ),
              ),
              child: Column(
                children: [
                  Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Mi diario de comidas",
                          style: TextStyle(
                              fontFamily: 'figtree',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: () {},
                          child: Text('Ver mas'),
                        )),
                  ]),
              SizedBox(
  height: 150,
  width: 1000,
  child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ListView.builder(

          itemCount: listadiario.length,
          itemBuilder: (BuildContext context, int index) {
            return gridelemento(datos: listadiario.elementAt(index));
          },
        ),
      ],
    ),
  ),
),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 40),
                          backgroundColor: Colors.green),
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: Nuevacomida(),
                              );
                            },
                          )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),

          // miBoton(titulo:"Mi dieta", icono:Icons.list_sharp),
          /**   SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                gridelemento(),
                gridelemento(),
                gridelemento(),
                gridelemento(),
          
              ]),
            ),*/
        ]),
      ),
    );
  }
}



class Miboton extends StatelessWidget {
  String? titulo;
  IconData? icono;
  Miboton({super.key, this.titulo, this.icono});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(

            // gradient:
            //   LinearGradient(colors: [Colors.green, Colors.greenAccent])
            ),
        padding: EdgeInsets.all(5),
        child: Row(children: [
          SizedBox(width: 10),
          Container(
            child: Icon(
              icono,
              color: Colors.blue,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Text(titulo.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              )),
        ]),
      ),
    );
  }
}

class gridelemento extends StatelessWidget {
  double ancho = 100;
  double largo = 150;
  Elementodatos? datos;

  gridelemento({super.key, required this.datos});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: largo,
        width: ancho,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.orange,
          gradient: SweepGradient(
            colors: [Color(0xff4caf50), Color(0xff00bcd4), Color(0xfff44336)],
            stops: [0.25, 0.75, 0.87],
            center: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(45),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
            child: Stack(children: [
              Center(
                child: Container(
                  width: ancho - 10,
                  height: ancho - 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amberAccent,
                      image:DecorationImage(image:datos!.obtenerFoto())),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 10,
                right: 10,
                child: Center(child: Text(datos!.obtenerNombre(), style: estilo20)),
              )
            ])),
      ),
    );
  }
}

class grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(8),
      child: GridView.count(crossAxisCount: 2, children: [
      ]),
    );
  }
}

class DatosColumna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(children: [
          Datos(icono: Icons.monitor_heart, texto: "Mi peso: 92 kg."),
          Datos(icono: Icons.height, texto: "Altura: 1.76 mts."),
          Datos(icono: Icons.percent_rounded, texto: "IMC: 26%"),
          Datos(icono: Icons.details_outlined, texto: "Colesterol: 160mg/dl"),
        ]));
  }
}


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(20),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        alignment: Alignment.centerLeft,
        child: Stack(children: [
          CircularProgressIndicator(
            value: 0.1,
            strokeWidth: 5,
            strokeCap: StrokeCap.round,
            color: Colors.greenAccent,
            backgroundColor: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 8,
            ),
            child: Text("10%", textAlign: TextAlign.center),
          )
        ]),
      ),
    );
  }



