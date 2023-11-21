

import 'package:flutter/material.dart';

class miBotonAct extends StatelessWidget{
  late String? titulo;
  late IconData? icono;
  miBotonAct({this.titulo,this.icono});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
    
    decoration: BoxDecoration(
            gradient:LinearGradient(colors:[Colors.green,Colors.greenAccent]),
            borderRadius: BorderRadius.circular(20),
        boxShadow:const [BoxShadow(
          
    color: Colors.black26,
    offset: Offset(0, 0.1),
    blurRadius: 15,
    ),
        ]
        
    ),
    width: MediaQuery.sizeOf(context).width/1.1,
    height: 70,

    child:Row(
      children:[
        SizedBox(width:20),
        Container(
          child:     
          Icon(
      icono,
      color: Colors.white,
      size: 50,
    ),),
                SizedBox(width:20),
      Text(titulo.toString(),   
           overflow:TextOverflow.ellipsis,
  
           style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,)),
      ]
    ),
  );
      
    

  }
  
 
}