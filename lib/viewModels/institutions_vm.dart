import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/institutions_model.dart';
import 'package:prueba_tecnica/services/api_services.dart';

class InstitutionsVM extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<DataModel> _data = [];
  List<DataModel> get data => _data;

  List<DataModel> _filteredData = [];
  List<DataModel> get filteredData => _filteredData;

  Future<void> fetchData(String codMun) async {
     try {
      final response = await _apiService.fetchInstitutiones(codMun);
      if (response['login'] == 'Success') {
        final List<dynamic> institucionesData = response['data'];
        _data = institucionesData.map((json) => DataModel.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Error: ${response['login']}');
      }
    } catch (error) {
      print("Error al obtener los datos en el view model $error");
    }
  }
  void search(String query) {
    if (query.isEmpty) {
      _filteredData = _data;
    } else {
      _filteredData = _data.where((item) {
        return item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.dane.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}

