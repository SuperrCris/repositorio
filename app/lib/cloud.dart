import 'package:cloud_firestore/cloud_firestore.dart';



Future<List> getDatos() async {
FirebaseFirestore db = FirebaseFirestore.instance;
List datos = [];

  await db.collection("Datos").get().then((event) {
  for (var doc in event.docs) {
    datos.add("${doc.id} => ${doc.data()}");
  }
});
return datos;
}