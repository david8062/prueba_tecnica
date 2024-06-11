

class InfoGroup {
final String id;
final String name;
final String school;
final String institution;
final String muni; //para el municipio
final String group;

InfoGroup ({required this.id,
  required this.name,
  required this.school,
  required this.institution,
  required this.muni,
  required this.group});

factory InfoGroup.fromJson(Map<String, dynamic> json) {
  return InfoGroup(
    id: json['id'] ?? '',
    name: json['nombre'] ?? '',
    school: json['sede'] ?? '',
    institution: json['institución'] ?? '',
    muni: json['municipio'] ?? '',
    group: json['numGroup'],
  );
}
}