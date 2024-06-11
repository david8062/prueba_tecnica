import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/config.dart';

class ApiService {
  //Api de consulta de los municipios
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
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener los datos');
    }
  }

  //Api de consulta para instituciones
  Future<dynamic> fetchInstitutiones(String codMun) async {
    final response = await http.post(
      Uri.parse(AppConfig.apiUrl),

      body: jsonEncode(<String, String>{
        "User": AppConfig.username,
        "Password": AppConfig.password,
        "option": "instituciones",
        "CodMun": codMun,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Error al obtener los datos de instituciones para $codMun');
    }
  }

  //Api consulta de sedes de colegio
  Future<dynamic> fetchSchools(String codMun) async {
       final response = await http.post(
      Uri.parse(AppConfig.apiUrl),
      body: jsonEncode(<String, String>{
        "User": AppConfig.username,
        "Password": AppConfig.password,
        "option": "sedes",
        "CodInst": codMun,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {

      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Error al obtener los datos de sedes para $codMun');
    }
  }

  //API consultas grupos
  Future<dynamic> fetchGroups(String codMun) async {
    final response = await http.post(
      Uri.parse(AppConfig.apiUrl),
      body: jsonEncode(<String, String>{
        "User": AppConfig.username,
        "Password": AppConfig.password,
        "option": "grupos",
        "CodSede:": codMun,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Error al obtener los datos de grupos para $codMun');
    }
  }
  //Api consulta datos del grupo
  Future<dynamic> fetchDataGroup(String codMun) async {
    final response = await http.post(
      Uri.parse(AppConfig.apiUrl),
      body: jsonEncode(<String, String>{
        "User": AppConfig.username,
        "Password": AppConfig.password,
        "option": "infoGrupo",
        "IdGrupo:": codMun,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Error al obtener los datos de grupos para $codMun');
    }
  }
}
