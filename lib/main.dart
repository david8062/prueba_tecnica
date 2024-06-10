import 'package:flutter/material.dart';
import 'package:prueba_tecnica/views/municipality_view.dart';
void main() {
  runApp(const Inicio());
}


class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Prueba",
      home: Municipality(),


    );
  }
}