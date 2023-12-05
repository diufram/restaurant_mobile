import 'dart:convert';

List<Horario> horarioFromJson(String str) =>
    List<Horario>.from(json.decode(str).map((x) => Horario.fromJson(x)));

String horarioToJson(List<Horario> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Horario {
  int id;
  String hora;
  int cantidad;
  DateTime createdAt;
  DateTime updatedAt;

  Horario({
    required this.id,
    required this.hora,
    required this.cantidad,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        id: json["id"],
        hora: json["hora"],
        cantidad: json["cantidad"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hora": hora,
        "cantidad": cantidad,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
