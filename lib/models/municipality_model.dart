class MunicipalityModel {
  final String name;
  final String dane;

  MunicipalityModel({
    required this.name,
    required this.dane,
  });

  // Metodo para convetir el json en una instancia
  factory MunicipalityModel.fromJson(Map<String, dynamic> json) {
    return MunicipalityModel(
      name: json['nombre'] ?? '',
      dane: json['dane'] ?? '',
    );
  }
}