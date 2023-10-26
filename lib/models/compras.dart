import 'dart:convert';

List<Compras> comprasFromJson(String str) =>
    List<Compras>.from(json.decode(str).map((x) => Compras.fromJson(x)));

String comprasToJson(List<Compras> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Compras {
  int id;
  int empleadoId;
  int direccionId;
  int tipoPagoId;
  int promocionId;
  int tipoOdenId;
  int clienteId;
  DateTime fecha;
  int subtotal;
  int descuento;
  int total;
  DateTime createdAt;
  DateTime updatedAt;

  Compras({
    required this.id,
    required this.empleadoId,
    required this.direccionId,
    required this.tipoPagoId,
    required this.promocionId,
    required this.tipoOdenId,
    required this.clienteId,
    required this.fecha,
    required this.subtotal,
    required this.descuento,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Compras.fromJson(Map<String, dynamic> json) => Compras(
        id: json["id"],
        empleadoId: json["empleado_id"],
        direccionId: json["direccion_id"],
        tipoPagoId: json["tipoPago_id"],
        promocionId: json["promocion_id"],
        tipoOdenId: json["tipoOden_id"],
        clienteId: json["cliente_id"],
        fecha: DateTime.parse(json["fecha"]),
        subtotal: json["subtotal"],
        descuento: json["descuento"],
        total: json["total"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "empleado_id": empleadoId,
        "direccion_id": direccionId,
        "tipoPago_id": tipoPagoId,
        "promocion_id": promocionId,
        "tipoOden_id": tipoOdenId,
        "cliente_id": clienteId,
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "subtotal": subtotal,
        "descuento": descuento,
        "total": total,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
