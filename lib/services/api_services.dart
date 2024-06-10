import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/config.dart';

class ApiService {

  Future<dynamic> fetchMunicipios() async {
    final response = await http.post(
      Uri.parse(AppConfig.apiUrl),
      body: jsonEncode(<String, String>{
        "User": AppConfig.username,
        "Password": AppConfig.password,
        "option": "municipios",
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Peticion Exitosa");
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener los datos');
    }
  }
}