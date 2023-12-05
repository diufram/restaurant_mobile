import 'dart:convert';

List<Productos> productosFromJson(String str) => List<Productos>.from(json.decode(str).map((x) => Productos.fromJson(x)));

String productosToJson(List<Productos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Productos {
    int id;
    int categoriaId;
    String nombre;
    String precio;
    String imagen;
    int stock;
    String descripcion;
    bool disponibilida;
    DateTime createdAt;
    DateTime updatedAt;

    Productos({
        required this.id,
        required this.categoriaId,
        required this.nombre,
        required this.precio,
        required this.imagen,
        required this.stock,
        required this.descripcion,
        required this.disponibilida,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        id: json["id"],
        categoriaId: json["categoria_id"],
        nombre: json["nombre"],
        precio: json["precio"],
        imagen: json["imagen"],
        stock: json["stock"],
        descripcion: json["descripcion"],
        disponibilida: json["disponibilida"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "categoria_id": categoriaId,
        "nombre": nombre,
        "precio": precio,
        "imagen": imagen,
        "stock": stock,
        "descripcion": descripcion,
        "disponibilida": disponibilida,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}