import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/components/search.dart';
import 'package:prueba_tecnica/components/navbar.dart';
import 'package:prueba_tecnica/views/groups_view.dart';
import '../components/custom_data_table.dart';
import '../viewModels/school_vm.dart';


class SchoolsView extends StatefulWidget {

  final String dane;
  final String name;
  const SchoolsView({super.key, required this.dane, required this.name});

  @override
  State<SchoolsView> createState() => _SchoolsState();
}

class _SchoolsState extends State<SchoolsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: ChangeNotifierProvider(
        create: (_) => SchoolVM(),
        child: Column(
          children: [
            _buildTitle(widget.name),
            const Search(),
            Expanded(
              child: CustomDataTable<SchoolVM>(
                dane: widget.dane,
                name: widget.name,
                fetchData: (vm, dane, name) => vm.fetchData(widget.dane),
                onButtonPressed: (dane, name) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupsView(dane: dane, name: name,),
                    ),
                  );
                },

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(name) {

    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "Sedes de $name",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
