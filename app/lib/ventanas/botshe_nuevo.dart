import 'dart:io';

import 'package:app/miswidgets/contenedor.dart';
import 'package:app/miswidgets/estilos/textos.dart';
import 'package:app/servicios/camara.dart';
import 'package:app/servicios/otracamara.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Nuevacomida extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    return Nc();
  }
}

class Nc extends StatefulWidget{
  List<PickedFile> imagenes = [];
  final escogeImagen = ImagePicker();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Nc();
  }
}

class _Nc extends State<Nc>{
  String? selectedColor = 'Desayuno';
List <PickedFile> imagenes = [];
final imagePicker = ImagePicker(); 
  // Lista de colores para mostrar en el menú desplegable
  List<String> colores = ['Desayuno', 'Colación temprana', 'Comida', 'Colación tardia', 'Cena'];


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(seconds: 1),
    decoration: BoxDecoration(),
    child: 
    SingleChildScrollView(
      child: Column(
      children: [

        const SizedBox(height: 30,),
     const  Center(child: Text("Añadir a mi diario",textAlign: TextAlign.center,style: estilo50,),),
     const   Center(child: Text("Foto",style: estilo12verde,),),
     GestureDetector(
      child:  Container(
          padding: const EdgeInsets.all(30),
          width: 200,
          height: 200,
          decoration: decoracion(),
          child: const Icon(Icons.photo_camera),
         ),
     onTap: () async {
String path = await Navigator.push(context, MaterialPageRoute(builder: (context) => CamaraPantalla()));
PickedFile pf = PickedFile(path);
imagenes.add(pf);

setState(() {
});


      
     }
     ),
        
                SizedBox(height: 30,),
                Center(child: Text("Nombre del alimento",style:  TextStyle( fontFamily: 'figtree', fontSize:12,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 58, 183, 68),),)),
              Container(padding: EdgeInsets.symmetric(horizontal:30),child:  TextFormField(
                style: TextStyle( fontFamily: 'figtree', fontSize:30,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 58, 183, 68),),
                decoration: InputDecoration(             hintText:"Sandwich de..." ,hintStyle: TextStyle( fontFamily: 'figtree', fontSize:30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 200, 228, 202)) ,
                enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.black12),   
                      ),  ),
                ),
              
                ),
        const SizedBox(height: 50),
        const  Center(child: Text("Tiempo",style:  estilo12verde,)),
         Container( padding: EdgeInsets.only(bottom: 10,left: 30,right:30),
           child: DropdownButton<String>(
            value: selectedColor,
            isExpanded: true,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: const Color.fromARGB(255, 58, 183, 68)),
            onChanged: (newValue) {
              setState(() {
                selectedColor = newValue;
              });
            },
            items: colores.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,textAlign: TextAlign.center,style: TextStyle( fontFamily: 'figtree', fontSize:30,fontWeight: FontWeight.bold,)),
              );
            }).toList(),
                   ),
         ),
       const SizedBox(height: 50,),
       Padding(padding: const EdgeInsets.symmetric(vertical: 10),child:ElevatedButton (onPressed:()=> {Navigator.pop(context)}, 
       style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 58, 183, 68)),
       child: const Text("Añadir",textAlign: TextAlign.center,style: TextStyle( fontFamily: 'figtree', fontSize:30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255),)),
       ),
       ),
      
      ],
      ),),  );
  }

  BoxDecoration decoracion(){
BoxDecoration bd = BoxDecoration();

if (imagenes.isNotEmpty){
  bd = BoxDecoration(
  image: DecorationImage(image: FileImage(File(imagenes.last.path)),
  fit: BoxFit.cover),);
} else {
       bd    =    BoxDecoration(
            color:  Color.fromARGB(255, 12, 12, 12), 
          );
}


    return bd;
  }
}

 XFile? imagen;


 

