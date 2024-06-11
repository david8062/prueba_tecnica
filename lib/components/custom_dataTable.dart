import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/assets/styles/colors.dart';

class CustomDataTable<T extends ChangeNotifier> extends StatelessWidget {
  final String? dane;
  final String? name;
  final Future<void> Function(T, String?, String?) fetchData;
  final Function(String dane, String name)? onButtonPressed;

  const CustomDataTable({
    super.key,
    this.dane,
    this.name,
    required this.fetchData,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<T>(context, listen: false);

    return FutureBuilder<void>(
      future: fetchData(viewModel, dane, name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar los datos'));
        } else {
          return Consumer<T>(
            builder: (context, vm, child) {
              final data = (vm as dynamic).data; // Access data dynamically
              if (data.isEmpty) {
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
                    rows: data.map<DataRow>((item) {
                      return DataRow(
                        color: MaterialStateColor.resolveWith(
                                (states) => Colors.white),
                        cells: [
                          DataCell(
                            SizedBox(
                              height: 100,
                              child: Text(
                                item.name,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              height: 100,
                              child: Text(
                                item.dane,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          DataCell(
                            ElevatedButton(
                              onPressed: () {
                                if (onButtonPressed != null) {
                                  onButtonPressed!(item.dane, item.name);
                                }
                              },
                              child: const Text(
                                "Consulta",
                                style: TextStyle(
                                  color: AppColors.textColors,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
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
}
