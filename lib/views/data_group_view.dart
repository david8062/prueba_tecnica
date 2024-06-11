import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/components/navbar.dart';
import '../components/notFound.dart';
import '../models/info_group_model.dart';
import '../viewModels/info_group_vm.dart';


class DataGroupView extends StatelessWidget {

  final String id;
  const DataGroupView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: const NavBar(),
      body: FutureBuilder(
        future: Provider.of<InfoGroupVM>(context, listen: false).fetchData(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {

            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Consumer<InfoGroupVM>(
              builder: (context, infoGroupVM, child) {
                return ListView.builder(
                  itemCount: infoGroupVM.data.length,
                  itemBuilder: (context, index) {
                    final InfoGroup infoGroup = infoGroupVM.data[index];
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(infoGroup.name),
                          Text(infoGroup.school),
                          Text(infoGroup.institution),
                          Text(infoGroup.muni),
                          Text(infoGroup.group),
                        ],
                      ),

                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
