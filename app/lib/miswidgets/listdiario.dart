import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
enum Estado {
registrado,distinto, desconocido,noregistrado,espera
}

class Elediario extends StatefulWidget {

  final String comida;
final Estado estado;


  const Elediario({super.key, required this.comida,required this.estado}) : super();

  @override
  // ignore: no_logic_in_create_state
  State<Elediario> createState() => DiarioEstado(comida,estado);
}

class DiarioEstado extends State<Elediario> {

final String comida;
final Estado estado;

DiarioEstado(this.comida, this.estado,);
 String imageUrl = ''; // URL de la imagen en Firebase Storage

  // Función para descargar la imagen desde Firebase Storage
  Future<void> downloadImage() async {
    // Reemplaza 'tu/ruta/a/la/imagen.jpg' con la ruta de tu imagen en Firebase Storage
    Reference ref = FirebaseStorage.instance.ref().child('fotos/usuarios/cristian/24-01-2024/atun.jpg');

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
 
  
    return  Container(

          margin: EdgeInsets.all(5),
          height: 100,
          padding:EdgeInsets.all(10),
        decoration:BoxDecoration( 
                color: Colors.white,       
        borderRadius:BorderRadius.all(Radius.circular(10)),
        ),
          child:Row(
          children:[
     
             marca(estado, imageUrl),
            
            Expanded(child:Container(
            alignment:Alignment.centerLeft,
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
            children:[
             Text(comida,style:TextStyle(fontSize:28)),
             Text("Una breve descripcion del alimento enlistado",
                   style:TextStyle(fontSize:12),overflow:TextOverflow.fade),
              
            ],
            ),
            ),),
            
           Container(
              alignment:Alignment.bottomRight,
            child:ElevatedButton(onPressed:()=>{},
                  style:ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.green)),
                  child:Icon(Icons.visibility,color:Colors.white)              
                                ),
            
            ),
          ],
          ),
          
          


   
   );
  }
}














Container marca (Estado _tipo, String url) {
  String ur = url;
  Estado tipo = _tipo;
  Container contenedor;
  Icon icon;
  Color color1;
  Color color2;

switch(tipo){
case Estado.registrado:

icon = Icon(Icons.check,color: Colors.white,);
color1 = Color(0xff49ec04);
color2 = Color(0xff1cc705);
break;
  case Estado.distinto:
color1 = Color.fromARGB(255, 26, 193, 196);
color2 = Color.fromARGB(255, 5, 144, 199);
icon = Icon(Icons.check,color: Colors.white,);
break;
  case Estado.desconocido:
color1 = Color.fromARGB(255, 232, 239, 31);
color2 = Color.fromARGB(255, 173, 175, 5);
icon = Icon(Icons.question_mark,color: Colors.white,);
break;
  case Estado.noregistrado:
color1 = Color.fromARGB(255, 239, 31, 31);
color2 = Color.fromARGB(255, 139, 4, 4);
icon = Icon(Icons.close,color: Colors.white,);
break;
  case Estado.espera:
color1 = Color.fromARGB(255, 128, 31, 239);
color2 = Color.fromARGB(255, 4, 29, 139);
   icon = Icon(Icons.more_horiz,color: Colors.white,);
break;
} 

contenedor =            
              Container(
                margin: EdgeInsets.only(right: 10),
              decoration:BoxDecoration(
              shape:BoxShape.circle,
              gradient:RadialGradient(
          colors: [Color(0xff49ec04), Color(0xff1cc705)],
          stops: [0.3, 0.75],
          center: Alignment.center,
        ),
        
              ),
            child: Stack(children:[
              
              SizedBox(
                height:70,
                width:70,
                  child:
                   ur == null
            ? const CircularProgressIndicator(color: Colors.grey,)
            : Container(
        
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                      color: Colors.green,
                ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: ur,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
                  
                  ),
      
              
              Positioned(
                bottom: 1,
                right: 1,
                child:Container(
                 height:30,
                width:30,
                decoration:BoxDecoration(
              shape:BoxShape.circle,
              color:color1,
              ),
              child:icon,
              ),),
              ]),
            );
return contenedor;
}





