
import 'package:flutter/material.dart';
class Contenedor extends StatefulWidget{
dynamic cosas;
Contenedor({super.key, this.cosas});
  @override
  State<StatefulWidget> createState() {
    return con(cosas);
  }
}


  class con extends State<Contenedor>{
dynamic cosas;
con(this.cosas);
  @override
  Widget build(BuildContext context) {
  return Container(
  padding: EdgeInsets.all(20),
  margin: const EdgeInsets.symmetric(horizontal: 30),      
 width: double.infinity,
decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(30),
  boxShadow:const [BoxShadow(
    color: Colors.black45,
    offset: Offset(0, 1),
    blurRadius: 15,
    ),
  ]
  
),  child: cosas,  );
  }
    
  }