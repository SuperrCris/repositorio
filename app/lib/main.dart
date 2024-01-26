
import 'package:app/miswidgets/contenedor.dart';
import 'package:app/servicios/firebase_options.dart';
import 'package:app/miswidgets/entrada_texto.dart';
import 'package:app/miswidgets/entrada_texto_contraseNa.dart';
import 'package:app/miswidgets/miboton.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ventanas/moin.dart';

void main() async {    
  try {
          WidgetsFlutterBinding.ensureInitialized();
  //final cameras = await availableCameras();
//  final firstCamera = cameras.first;


  } catch (e){
e;
  }

try{
  await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
  );

}catch(e){print(e);}

  
  runApp(InicioSesion());
}

class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: MiInicioSesion(),
   theme: ThemeData(
    useMaterial3: true,

    // Define the default brightness and colors.
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 39, 176, 48),
      // ···
      brightness: Brightness.light,
    ),

    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
    
   ),));
  }
}

class MiInicioSesion extends StatefulWidget {
  const MiInicioSesion({super.key});

  @override
  State<StatefulWidget> createState() {
    return Forma();
  }
}

class Forma extends State<MiInicioSesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
      
        child: Container(
height: MediaQuery.sizeOf(context).height,
          child: Column(
            
            children: [
           Container(
          
          height: MediaQuery.sizeOf(context).height/3,
          width: MediaQuery.sizeOf(context).height/3,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("recursos/sergio.png"),fit: BoxFit.cover)),
              ),
              Expanded(
                child: Container(
                  child: Column(
                  children: [
                     Expanded(
                       child: Contenedor(cosas: Column(
                           children:[
                          
                         
                                   const Text("Bienvenido",style: TextStyle(fontSize: 50,color: Color.fromARGB(255, 255, 255, 255)), textAlign: TextAlign.left,),
                          const Text("Inicia sesion",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 255, 255, 255)), ),
                          const SizedBox(height: 30,),
                         entradaTexto(),
                          const SizedBox(height: 30,),
                         EntradaTextoContrasena(),
                          const SizedBox(height: 30,),
                          miBoton(ruta:  const MyApp()),
                          Container(margin: EdgeInsets.only(top: 50), child: Text("¿Olvidaste tu contraseña?",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 255, 255, 255))),),
                         
                         ]
                         
                         ), ),
                     ),
                
                
                       
                
                
                 ]
                         ), ),
              ),
               ] 
              ),
        ),
      ),);
  }
}
