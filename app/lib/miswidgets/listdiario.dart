import 'package:flutter/material.dart';

enum Estado {
registrado,distinto, desconocido,noregistrado,espera
}


class EleDiario extends StatelessWidget {
final String comida;
final Estado estado;
const EleDiario({super.key, required this.comida,required this.estado});

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
     
             marca(estado),
            
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


Container marca (Estado _tipo) {
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
              
              Container(
                height:70,
                width:70,
                  decoration:BoxDecoration(
              shape:BoxShape.circle,
              color:Colors.cyan,
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