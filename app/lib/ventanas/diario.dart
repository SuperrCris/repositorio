// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


import 'package:app/miswidgets/listdiario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
runApp(const AppDiario());}
  List<String> orden = ["Desayuno","Colación temprana","Comida","Colación tardía","Cena"];
class AppDiario extends StatelessWidget {
  const AppDiario({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  }) : super();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   DateTime fechaSeleccionada = DateTime.now();
      String usuario = "Cristian";
 

  @override
  Widget build(BuildContext context) {
    
  
    double largo = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        height: largo,
            decoration: const BoxDecoration(
            gradient: LinearGradient(
            colors: [Color(0xffd1e0d2), Color(0xffc9eed5)],
            stops: [0.25, 0.75],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(margin:EdgeInsets.only(left: 10,top: 10),height:100,alignment:Alignment.bottomLeft,
                child: 
                Row(children: [
                  Text("Hoy",style: TextStyle(fontSize: 60, color: Colors.black),),
                  IconButton(
                    onPressed: () async{
                          final DateTime? tiempo = await showDatePicker(context: context, 
                          initialDate: fechaSeleccionada,
                          firstDate: DateTime(2000), 
                          lastDate: DateTime(3000));
                          if (tiempo != null){
                            setState(() {
                              fechaSeleccionada = tiempo;
                              print(fechaSeleccionada);
                            });
                          }
                  }, icon: Icon(Icons.date_range))
                  ],),),
              SizedBox(
 height: 1000,
              child:
       FutureBuilder <List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
        future: obtenerDatos(),
        builder: (context,AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
            } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, i) {
              String tiempo = snapshot.data![i].id;
              QueryDocumentSnapshot<Map<String, dynamic>>? datos;
              datos = snapshot.data?.elementAt(i) ;
              return Elediario(
              comida: datos!['nombre'], 
              estado: Estado.values[datos['estado']], 
              fotoRef: datos['imagen'],
              tiempo:tiempo,
              descripcion: datos['descripcion'],
              );
            },
            );
          }
        },
      ),  ),
               
               
               
            
              ],
            ),
          ),

      ),

    );
  }
}
 Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> obtenerDatos() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('Datos')
        .doc('Usuarios')
        .collection('Cristian')
        .doc('Dietas')
        .collection('24-01-2024').get();
        
 var documentosMap = {};
  for (var documento in snapshot.docs) {
    documentosMap[documento.id] = documento;
  }

 List<QueryDocumentSnapshot<Map<String, dynamic>>> documentosOrdenados = [];
  for (var nombre in orden) {
    if (documentosMap.containsKey(nombre)) {
      documentosOrdenados.add(documentosMap[nombre]!);
    }
  }


  return documentosOrdenados;
}



