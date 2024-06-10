import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/municipality_model.dart';
import 'package:prueba_tecnica/services/api_services.dart';

class MunicipalityVM extends ChangeNotifier {
    final ApiService _apiService = ApiService();
    List<MunicipalityModel> _data = [];
    List<MunicipalityModel> get data => _data;

    Future<void> fetchData() async {
        try {
            final response = await _apiService.fetchMunicipios();
            if (response['login'] == 'Success') {
                final List<dynamic> municipiosData = response['data'];
                _data = municipiosData.map((json) => MunicipalityModel.fromJson(json)).toList();
                notifyListeners();
            } else {
                throw Exception('Error: ${response['login']}');
            }
        } catch (error) {
            print("Error al obtener los datos en el view model $error");
        }
    }
}
