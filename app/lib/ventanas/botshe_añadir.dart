

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';



class contextoanadir extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
     height : MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height/20,),
          Text("¿Comiste lo que te tocaba a Mediodia? Debias comer Sandwich de pollo",textAlign: TextAlign.center,style: TextStyle( fontFamily: 'figtree', fontSize:30,fontWeight: FontWeight.bold,),),
          SizedBox(height: MediaQuery.sizeOf(context).height/20,),
          Row(children: [
            Btnopcion(texto: "Si", opcion: Opcion.positivo),
            Expanded(child: SizedBox(),),
            Btnopcion(texto: "No", opcion: Opcion.negativo),
          ],)

        ],

      ),


    );
  }
}
 
 enum  Opcion
{
    positivo, negativo
}


class Btnopcion extends StatelessWidget{
  String texto;
Opcion opcion;
    Btnopcion({required this.texto,required this.opcion});
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(child:Container(
   
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            gradient: color(opcion),),
            child:ElevatedButton(onPressed:()=>{Navigator.pop(context)} , child:  Column(
            children: [
             Icon(icono(opcion),size: 100,color:Colors.white),
               Text(texto,textAlign: TextAlign.center,style: TextStyle( fontFamily: 'figtree', fontSize:30,fontWeight: FontWeight.bold,color: Colors.white),)
            ],
          ), 
          style: ElevatedButton.styleFrom(padding:EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor:Colors.transparent, shadowColor: Colors.transparent,),
          )
 
         ),     );
   
  }


}

IconData icono(Opcion opcion){
  IconData iconodatos;
  switch(opcion){
  case Opcion.positivo: iconodatos = Icons.check; break;
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


  }
 return gradiente; 
}