import 'package:flutter/material.dart';

class entradaTexto extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
return entrada();

  }
}
class entrada extends State<entradaTexto>

{
    final emailController = TextEditingController();
    
  @override
  void initState() {
    super.initState();
      emailController.addListener(()=> setState(() {}));
  }



  @override
  Widget build(BuildContext context) {
return  TextFormField(
     
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: Colors.white,
        labelText:"Correo electronico",
        hintText: "soysano@hotmail.com",
        prefixIcon: Icon(Icons.mail),
        border: OutlineInputBorder(),
        suffixIcon: emailController.text.isEmpty
        ? Container(width: 0)
        : IconButton(
         icon: Icon(Icons.close), 
         onPressed: () => emailController.clear(),),
      ),
    );



  }
}