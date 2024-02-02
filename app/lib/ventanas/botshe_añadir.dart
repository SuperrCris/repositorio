

import 'package:app/miswidgets/listdiario.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';




class Anadir extends StatefulWidget{
  final String comida;
  final String fotoRef;
  final String tiempo;
  final String descripcion;
  final Estado estado;
  final Function(Estado es) actualizar;
  const Anadir({super.key,
   required this.comida,
    required this.fotoRef,
     required this.tiempo,
      required this.descripcion,
       required this.estado, 
       required this.actualizar}): super();
  @override
  State<StatefulWidget> createState() => 
  // ignore: no_logic_in_create_state
  AnadirEstado(comida: comida, estado: estado, fotoRef: fotoRef, tiempo: tiempo, descripcion: descripcion, actualizar: actualizar);
}


class AnadirEstado extends State<Anadir>{
  final String comida;
  final String fotoRef;
  final String tiempo;
  final String descripcion;
  final Estado estado;
  final Function actualizar;
  String imageUrl = "";

  AnadirEstado( {required this.comida, required this.estado, required this.fotoRef, required this.tiempo, required this.descripcion, required this.actualizar});

  Future<void> downloadImage() async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('fotos/usuarios/cristian/24-01-2024/$fotoRef');

    try {
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
      });
    } catch (e) {
      print('Error al descargar la imagen: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    downloadImage();
  }



  @override
  Widget build(BuildContext context) {
   String tiempoo = tiempo.toLowerCase();
    return Container(
      alignment: Alignment.bottomCenter,
     height : MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [

           SizedBox(
        height: 200,
        width: 200,
        child: imageUrl == ""
            ? const CircularProgressIndicator(
                color: Colors.grey,
              )
            : Container(
                decoration: BoxDecoration(
                  boxShadow:  [
        BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: Offset(0, 3), 
      ),],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.green,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
      ),
           Text(comida,style: TextStyle(fontSize: 50),),
Container(
  padding: EdgeInsets.symmetric(vertical: 10),
  height: MediaQuery.sizeOf(context).height*0.3,
  width: MediaQuery.sizeOf(context).width*0.9,
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Text(descripcion,style: 
    TextStyle(color: Colors.black87,fontSize: 18,height: 1),textAlign: TextAlign.justify,overflow:TextOverflow.clip,)),
),

Expanded(

  child: SizedBox(
    width: 10,
  ),
),

Text("¿Este alimento fue tu $tiempoo?",style: TextStyle(fontSize: 20),),
SizedBox(height: 10,),
          SizedBox(
          child: StaggeredGrid.extent(
            maxCrossAxisExtent:190,
              crossAxisSpacing: 8.0, // Espacio horizontal entre las celdas
              mainAxisSpacing: 8.0, // Espacio vertical entre las celdas
              children: [
                StaggeredGridTile.extent(crossAxisCellCount:1, mainAxisExtent: 100, child: Btnopcion(texto: "Si, asi es", opcion: Opcion.positivo, tiempo: tiempo,estado:Estado.registrado,actualizarTabla: actualizar,)),
                StaggeredGridTile.extent(crossAxisCellCount:1, mainAxisExtent: 100, child: Btnopcion(texto: "No me alimente", opcion: Opcion.negativo,tiempo: tiempo,estado: Estado.noregistrado,actualizarTabla: actualizar,)),
                StaggeredGridTile.extent(crossAxisCellCount:2, mainAxisExtent: 100, child: Btnopcion(texto: "Me alimente con algo diferente", opcion: Opcion.otro,tiempo: tiempo,estado: Estado.distinto,actualizarTabla: actualizar,)),
              ],
            ),
        ),
      ]),
      );
  }
}
 
 enum  Opcion
{
    positivo, negativo, otro,
}


class Btnopcion extends StatelessWidget{
final String texto;
final Opcion opcion;
final String tiempo;
final Estado estado;
Function actualizarTabla;
    Btnopcion({super.key, required this.texto,required this.opcion, required this.tiempo, required this.estado, required this.actualizarTabla,});
  @override

  Widget build(BuildContext context) {


void marcar(int estado){
// Obtén una referencia a la colección y al documento que deseas actualizar
DocumentReference coleccion = FirebaseFirestore.instance
        .collection('Datos')
        .doc('Usuarios')
        .collection('Cristian')
        .doc('Dietas')
        .collection('24-01-2024')
        .doc(tiempo);


coleccion.update({
  'estado': estado,
})
    .then((value) {
      print(estado);
  print("Campo actualizado correctamente");
  print(coleccion.toString());

        Navigator.pop(context);
          actualizarTabla(this.estado);

})
    .catchError((error) {
  print("Error al actualizar el campo: $error");
});

}

    return  GestureDetector(
      child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                gradient: color(opcion),),
               
                    child: SizedBox(
                      height: 100,
                      child: Column(
                      children: [
                       Icon(icono(opcion),size: 52,color:Colors.white),
                         Text(texto,textAlign: TextAlign.center,style: TextStyle( fontFamily: 'figtree', fontSize:25,fontWeight: FontWeight.bold,height: 1,color: Colors.white),)
                      ],
                                ),
                    ),
                   
                            
             ),

             onTap: (){
              
              marcar(estado.index);

             },
    );
    

  }


}

IconData icono(Opcion opcion){
  IconData iconodatos;
  switch(opcion){
  case Opcion.positivo: iconodatos = Icons.check; break;
  case Opcion.otro: iconodatos = Icons.check; break;
  case Opcion.negativo: iconodatos = Icons.close; break;
  }
 return iconodatos; 
}

LinearGradient color(Opcion opcion){
  LinearGradient gradiente;
  switch(opcion){
  case Opcion.positivo: gradiente = const LinearGradient(
          colors: [Color(0xffc0fb41),Color(0xff34ef53), ],
          stops: [0.25, 0.75],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ; break;  

  case Opcion.negativo: gradiente = const LinearGradient(
          colors: [Color.fromARGB(255, 239, 93, 93),Color.fromARGB(255, 255, 31, 76), ],
          stops: [0.25, 0.75],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ; break;


    case Opcion.otro: gradiente = const LinearGradient(
          colors: [Color.fromARGB(255, 11, 183, 192),Color.fromARGB(255, 31, 131, 219), ],
          stops: [0.25, 0.75],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ;


     break;
  }
 return gradiente; 
}