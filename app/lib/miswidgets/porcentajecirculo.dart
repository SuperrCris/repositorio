import 'package:flutter/material.dart';

class Porcentaje extends StatelessWidget {
  const Porcentaje({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        alignment: Alignment.centerLeft,
        child: Stack(children: [
          CircularProgressIndicator(
            value: 0.1,
            strokeWidth: 5,
            strokeCap: StrokeCap.round,
            color: Colors.greenAccent,
            backgroundColor: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 8,
            ),
            child: Text("10%", textAlign: TextAlign.center),
          )
        ]),
      ),
    );
  }
}
