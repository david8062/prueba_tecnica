class DataModel  {
  final String name;
  final String dane;

  DataModel ({
    required this.name,
    required this.dane,
});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['nombre'] ?? '',
      dane: json['dane'] ?? '',
    );
  }

}