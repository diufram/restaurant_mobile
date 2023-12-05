import 'dart:convert';

List<Product> productoFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productoToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int id;
  int categoriaId;
  String nombre;
  String precio;
  int cantidad;
  String imagen;
  int stock;
  String descripcion;
  bool disponibilida;

  Product({
    required this.id,
    required this.categoriaId,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.imagen,
    required this.stock,
    required this.descripcion,
    required this.disponibilida,
  });

  setCantidad(int cantidad) {
    this.cantidad += cantidad;
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      categoriaId: json["categoria_id"],
      nombre: json["nombre"],
      precio: json["precio"],
      cantidad: 0,
      imagen: json["imagen"],
      stock: json["stock"],
      descripcion: json["descripcion"],
      disponibilida: json["disponibilida"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoria_id": categoriaId,
        "nombre": nombre,
        "precio": precio,
        "cantidad": cantidad,
        "imagen": imagen,
        "stock": stock,
        "descripcion": descripcion,
        "disponibilida": disponibilida
      };
}
