import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/info_group_model.dart';
import 'package:prueba_tecnica/services/api_services.dart';

class InfoGroupVM extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<InfoGroup> _data = [];
  List<InfoGroup> get data => _data;


  Future<void> fetchData(String codMun) async {
    try {
      final response = await _apiService.fetchGroups(codMun);
      if (response['login'] == 'Success') {
        final List<dynamic> institucionesData = response['data'];
        _data = institucionesData.map((json) => InfoGroup.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Error: ${response['login']}');
      }
    } catch (error) {
      throw Exception("Error al obtener los datos en el view model $error");
    }
  }


}
