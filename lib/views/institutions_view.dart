import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/assets/styles/colors.dart';
import 'package:prueba_tecnica/components/search.dart';
import 'package:prueba_tecnica/viewModels/institutions_vm.dart';
import 'package:prueba_tecnica/viewModels/municipality_vm.dart';
import 'package:prueba_tecnica/components/navbar.dart';

class InstitutionsView extends StatefulWidget {
  final String dane;

  const InstitutionsView({Key? key, required this.dane}) : super(key: key);

  @override
  State<InstitutionsView> createState() => _InstitutionsViewState();
}

class _InstitutionsViewState extends State<InstitutionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: Column(
        children: [
          _buildTitle(),
          const Search(),
          _buildInstitutionsList(context, widget.dane),
        ],
      ),
    );
  }
}

Widget _buildTitle() {
  return const Padding(
    padding: EdgeInsets.all(20.0),
    child: Text(
      "Instituciones",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget _buildInstitutionsList(BuildContext context, String dane) {
  return FutureBuilder<void>(
    future: Provider.of<InstitutionsVM>(context, listen: false).fetchData(dane),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return const Center(child: Text('Error al cargar los datos'));
      } else {
        return Consumer<InstitutionsVM>(
          builder: (context, vm, child) {
            if (vm.data.isEmpty) {
              return const Center(child: Text('No hay datos disponibles'));
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.background),
                  dataRowColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.background),
                  columns: const [
                    DataColumn(label: Text("Nombre")),
                    DataColumn(label: Text("Dane")),
                    DataColumn(label: Text(""))
                  ],
                  rows: vm.data.map((municipality) {
                    return DataRow(
                      color: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      cells: [
                        DataCell(
                          SizedBox(
                            height: 100, // Ajusta el ancho según sea necesario
                            child: Text(municipality.name,
                            style: const TextStyle (
                              fontSize: 12
                            ),
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            height: 100, // Ajusta el ancho según sea necesario
                            child: Text(municipality.dane,
                              style: const TextStyle (
                                  fontSize: 12
                              ),
                            ),
                          ),
                        ),
                        DataCell(ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Consulta",
                            style: TextStyle(
                                color: AppColors.textColors,
                                fontWeight: FontWeight.w400),
                          ),
                        ))
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          },
        );
      }
    },
  );
}
