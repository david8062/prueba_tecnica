import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/assets/styles/colors.dart';
import 'package:prueba_tecnica/components/search.dart';
import 'package:prueba_tecnica/viewModels/municipality_vm.dart';
import 'package:prueba_tecnica/components/navbar.dart';

class Municipality extends StatefulWidget {
  const Municipality();

  @override
  _MunicipalityState createState() => _MunicipalityState();
}

class _MunicipalityState extends State<Municipality> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: Column(
        children: [
          _buildTitle(),
          const Search(),
          _buildMunicipalityList(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "Municipios del Tolima",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildMunicipalityList() {
    return FutureBuilder<void>(
      future: Provider.of<MunicipalityVM>(context, listen: false).fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar los datos'));
        } else {
          return Consumer<MunicipalityVM>(
            builder: (context, vm, child) {
              if (vm.data.isEmpty) {
                return const Center(child: Text('No hay datos disponibles'));
              }
              return
                Padding(padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith((states) => AppColors.background),
                    dataRowColor: MaterialStateColor.resolveWith((states) => AppColors.background),
                    columns: const [
                      DataColumn(
                      label: Text ("Nombre")
                      ),
                      DataColumn(
                      label: Text("Dane")
                      ),
                      DataColumn(
                     label: Text("")
                      )
                    ],
                    rows: vm.data.map((municipality) {
                      return DataRow(
                        color: MaterialStateColor.resolveWith((states) => Colors.white), // Color de fondo de la fila de datos
                        cells: [
                          DataCell(Text(municipality.name)),
                          DataCell(Text(municipality.dane)),
                          DataCell(ElevatedButton(
                            onPressed: () {
                            },
                            child: Text("Consulta"),
                          ))
                        ],
                      );
                    }).toList(),
                  ) ,
                )


                );

            },
          );
        }
      },
    );
  }


}
