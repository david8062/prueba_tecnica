import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/groups_model.dart';
import 'package:prueba_tecnica/services/api_services.dart';

class GroupsVM extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<DataGroups> _data = [];
  List<DataGroups> get data => _data;


  Future<void> fetchData(String codMun) async {
    try {
      final response = await _apiService.fetchGroups(codMun);
      if (response['login'] == 'Success') {
        final List<dynamic> institucionesData = response['data'];
        _data = institucionesData.map((json) => DataGroups.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Error: ${response['login']}');
      }
    } catch (error) {
      throw Exception("Error al obtener los datos en el view model $error");
    }
  }


}
