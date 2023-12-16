
import 'package:app/miswidgets/porcentajecirculo.dart';
import 'package:app/ventanas/moin.dart';
import 'package:flutter/material.dart';

class Barradatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return 

  Container(
  decoration:  const BoxDecoration(
       /*     gradient:LinearGradient(
          colors: [Color(0xffdbdbdb), Color(0xffffffff)],
          stops: [0.05, 0.15],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      */

        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(90),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Colors.white,
        //    gradient:LinearGradient(colors:[Colors.white10,Colors.green])
        
     /**  boxShadow:[BoxShadow(    
          
          color: const Color.fromARGB(255, 230, 230, 230),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 0.1),),
    ] */ ),
      width:MediaQuery.sizeOf(context).width-10,
      height:250,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
         const SizedBox(height:10),
         const  Padding(padding:EdgeInsets.only(left:10),child:Text("Mi progreso:", style: TextStyle( fontFamily: 'figtree', fontSize:15,fontWeight: FontWeight.bold,)),),
        Row(
      children:[
        Expanded(child:Porcentaje()),Expanded(child:DatosColumna()),
      ]
      ),
      
              Row(
        children:[
        Padding(padding:EdgeInsets.symmetric(horizontal:26),child: Text("Has bajado 3.2 de 32 kilos", style: TextStyle( fontFamily: 'figtree', fontSize:15,fontWeight: FontWeight.bold,)),),
        Expanded (child:SizedBox(),),
        Padding(padding:EdgeInsets.symmetric(horizontal:20),child: Text("Ultima consulta: 20/11/2023", style: TextStyle( fontFamily: 'figtree', fontSize:15,fontWeight: FontWeight.bold,)),),    
 
 ]
      ), ]),
            

);
  }
}