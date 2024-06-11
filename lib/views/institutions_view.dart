import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/components/navbar.dart';
import 'package:prueba_tecnica/components/search.dart';
import 'package:prueba_tecnica/viewModels/institutions_vm.dart';
import 'package:prueba_tecnica/views/schools_view.dart';


import '../components/custom_dataTable.dart';

class InstitutionsView extends StatefulWidget {
  final String dane;
  final String name;
  const InstitutionsView({super.key, required this.dane, required this.name});

  @override
  State<InstitutionsView> createState() => _InstitutionsViewState();
}

class _InstitutionsViewState extends State<InstitutionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: ChangeNotifierProvider(
        create: (_) => InstitutionsVM(),
        child: Column(
          children: [
            _buildTitle(widget.name),
            const Search(),
            Expanded(
              child: CustomDataTable<InstitutionsVM>(
                dane: widget.dane,
                name: widget.name,
                fetchData: (vm, dane, name) => vm.fetchData(widget.dane),
                onButtonPressed: (dane, name) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchoolsView(dane: dane, name: name),
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
        "Instituciones de $name",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

