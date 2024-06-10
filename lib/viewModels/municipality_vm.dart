import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/municipality_model.dart';
import 'package:prueba_tecnica/services/api_services.dart';

class MunicipalityVM extends ChangeNotifier {
    final ApiService _apiService = ApiService();
    List<MunicipalityModel> _data = [];
    List<MunicipalityModel> get data => _data;

    Future<void> fetchData () async {
        try{
            final response = await _apiService.fetchMunicipios();
            _data = List<MunicipalityModel>.from(response.map((json) => MunicipalityModel.fromJson(json)));
        }
        catch (error){
            print("Error al obtener los datos $error");
        }
    }

}
