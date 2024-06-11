import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/components/search.dart';
import 'package:prueba_tecnica/components/navbar.dart';
import 'package:prueba_tecnica/views/institutions_view.dart';
import '../components/custom_data_table.dart';
import '../viewModels/municipality_vm.dart';


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
      body: ChangeNotifierProvider(
        create: (_) => MunicipalityVM(),
        child: Column(
          children: [
            _buildTitle(),
            const Search(),
            Expanded(
              child: CustomDataTable<MunicipalityVM>(
                fetchData: (vm, dane, name) => vm.fetchData(),
                onButtonPressed: (dane, name) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InstitutionsView(dane: dane, name: name),
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

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "Municipios",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}




