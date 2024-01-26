import 'package:flutter/material.dart';

class EntradaTextoContrasena extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
return entrada();

  }
}
class entrada extends State<EntradaTextoContrasena>

{
    final emailController = TextEditingController();
    bool esVisible = true;
  @override
  void initState() {
    super.initState();
      emailController.addListener(()=> setState(() {}));
      print("borrado");
  }



  @override
  Widget build(BuildContext context) {
return  TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      obscureText: esVisible,
      decoration: InputDecoration(
        hintText:"Contraseña",
        prefixIcon: Icon(Icons.key),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90.0),
        ),
        suffixIcon: IconButton(
          icon: esVisible
        ? Icon(Icons.visibility_off_outlined)
        : Icon(Icons.visibility),
        onPressed: ()=>setState (()=>esVisible = !esVisible),
     
      ),
      
 ), );



  }
}