import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/components/navbar.dart';
import '../assets/styles/colors.dart';
import '../components/notFound.dart';
import '../viewModels/groups_vm.dart';
import 'data_group_view.dart';

class GroupsView extends StatefulWidget {

 final String dane;
 final String name;
  const GroupsView({super.key,  required this.name, required this.dane});

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: ChangeNotifierProvider(
        create: (_) => GroupsVM(),
        child: Column(
          children: [
            _buildTitle(widget.name),
            _buildTableGroups(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(name) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "Grupos de $name",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTableGroups() {
    return FutureBuilder<void>(
      future: Provider.of<GroupsVM>(context, listen: false).fetchData(
          widget.dane),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar los datos'));
        } else {
          return Consumer<GroupsVM>(
            builder: (context, vm, child) {
              final data = vm.data;
              if (data.isEmpty) {
                return const NotFoundPage();
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
                      DataColumn(label: Text("id")),
                      DataColumn(label: Text("Nombre")),
                      DataColumn(label: Text("Grupo")),
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
                              width: 5,
                              child: Text(
                                item.id,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
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
                                item.numGroup,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          DataCell(
                              SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DataGroupView(id: item.id),
                            ),
                          );
                        },
                        child: const Text(
                          "Consulta",
                          style: TextStyle(
                            color: AppColors.textColors,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      )

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
