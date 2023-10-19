import 'package:e_comerce/models/producto.dart';
import 'package:flutter/material.dart';

class Carrito extends ChangeNotifier {
  final List<Producto> _menuComidas = [
    // MAJADITO
    Producto(
        nombre: "Majadito",
        precio: 30.0,
        imagenPath: 'lib/images/majadito.png',
        descripcion: "Este es un plato tradicional de santa cruz"),
    // PICANTE DE POLLO
    Producto(
        nombre: "Picante",
        precio: 50.0,
        imagenPath: 'lib/images/picante.png',
        descripcion: "Es un plato tradicional de cochabamba")
  ];

  List<Producto> _carrito = [];

  List<Producto> get menuComidas => _menuComidas;

  List<Producto> get carrito => _carrito;

  // AGREGAR AL CARRITO

  void agregarACarrito(Producto comidaItem, int cantidad) {
    for (int i = 0; i < cantidad; i++) {
      _carrito.add(comidaItem);
    }
    notifyListeners();
  }

  // REMOVER DEL CARRITO
  void removerDCarrito(Producto comidaItem) {
    _carrito.remove(comidaItem);
    notifyListeners();
  }
}
