
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
    
 width: double.infinity,
decoration: BoxDecoration(
gradient: LinearGradient(
          colors: [Color.fromARGB(255, 123, 226, 126), Colors.green],
          stops: [0.005, 0.02],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(90)
  ),

  
),  child: cosas,  );
  }
    
  }