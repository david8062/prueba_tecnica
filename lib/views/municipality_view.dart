import 'package:flutter/material.dart';

import 'package:prueba_tecnica/components/navbar.dart';
import 'package:prueba_tecnica/components/search.dart';
class Municipality extends StatefulWidget {
  const Municipality({super.key});

  @override
  State<Municipality> createState() => _MunicipalityState();
}

class _MunicipalityState extends State<Municipality> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: NavBar(),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(50.0),
          child:Text("Municipios del Tolima",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ) ),
          ),
          Search()
        ],
      ),
      );


  }
}
