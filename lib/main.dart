import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/viewModels/municipality_vm.dart';
import 'package:prueba_tecnica/views/municipality_view.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MunicipalityVM(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: Municipality(),
    );
  }
}