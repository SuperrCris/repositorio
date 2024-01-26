import 'package:app/miswidgets/estilos/textos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Botonconicono extends StatelessWidget {
 String texto;
 String diriconosvg;
 Color primercolor;
 Color segundocolor;
 dynamic ruta;


 Botonconicono({required this.texto, required this.diriconosvg,required this.primercolor,required this.segundocolor,this.ruta,super.key,});


  @override
  Widget build(BuildContext context) {
    return Flexible(
            child: FractionallySizedBox(
    heightFactor: 1,
    widthFactor: 1,
    child: GestureDetector(
      onTap: ()=>{
        if  (ruta != null){
            Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ruta),
      ),
        } else{print("No hay ruta establecida")}},
      child: Container(margin:EdgeInsets.all(10),
                       padding:EdgeInsets.all(10),
                      decoration: BoxDecoration(
                      gradient: SweepGradient(colors:[primercolor,segundocolor],
                                             stops: [0.3, 0.9],center: Alignment.bottomRight,),
                      borderRadius: BorderRadius.circular(10),
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Flexible(
      
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: SvgPicture.asset(diriconosvg, 
                            alignment:Alignment.topLeft,
                            fit: BoxFit.fitHeight,)
                          ),
                        
                        ),
    
                        Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(texto,style: estilo20,)),
                        ),
                      ],
                      ),
                      ),
    ),
            ),);
  }
}