class DataGroups {
  final String id;
  final String name;
  final String numGroup;

  DataGroups({
    required this.id,
    required this.name,
    required this.numGroup
  });

  factory DataGroups.fromJson(Map<String, dynamic> json) {
    return DataGroups(
      id: json['id'] ?? '',
      name: json['nombre'] ?? '',
      numGroup: json['numGrupo'] ?? '',
    );
  }
}
