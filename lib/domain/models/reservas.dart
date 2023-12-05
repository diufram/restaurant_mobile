import 'dart:convert';

List<Reservas> reservasFromJson(String str) =>
    List<Reservas>.from(json.decode(str).map((x) => Reservas.fromJson(x)));

String reservasToJson(List<Reservas> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reservas {
  int id;
  String hora;
  DateTime fecha;

  Reservas({
    required this.id,
    required this.hora,
    required this.fecha,
  });

  factory Reservas.fromJson(Map<String, dynamic> json) => Reservas(
        id: json["id"],
        hora: json["hora"],
        fecha: DateTime.parse(json["fecha"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hora": hora,
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
      };
}
