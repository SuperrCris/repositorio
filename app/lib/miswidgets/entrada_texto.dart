import 'package:flutter/material.dart';

class entradaTexto extends StatefulWidget {
  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<entradaTexto> {
  TextEditingController emailControlador= TextEditingController();
  bool tieneTexto = false;
  @override
  void initState() {
    super.initState();
      emailControlador.addListener(()=> setState(() {}));
      print("Estado de email cambiado");
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailControlador,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'Correo electronico',
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90.0),
        ),
       suffixIcon:  emailControlador.text.isNotEmpty
        ? IconButton(icon: Icon(Icons.close), onPressed: ()=>setState (()=>emailControlador.clear()))
        : null,
     
   )
    );
  }
}