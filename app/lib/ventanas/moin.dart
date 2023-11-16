
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "Si",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Fer")),
     body: Column(
      children: [
       const SizedBox(
          height: 10,
        ),
      Center(
        child: ClipRRect(
          
          child: Container(

            decoration: BoxDecoration(
            image: const DecorationImage(
              image:  AssetImage("recursos/ensalada.jpg"),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.rectangle,
            borderRadius:BorderRadius.circular(50),
            ),

          width: MediaQuery.of(context).size.width-50,
          height: (MediaQuery.of(context).size.height) / 3,
          
            child:Container (
                padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [Colors.green, Colors.transparent]),
              ),
            ),
          ),

        ),

      ),
      ],


     )
    );
  }
}
