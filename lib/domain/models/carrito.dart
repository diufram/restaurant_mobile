import 'dart:convert';

import 'package:e_comerce/data/respositories/local_repository.dart';
import 'package:e_comerce/domain/models/product.dart';
import 'package:e_comerce/services/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Carrito extends ChangeNotifier {
  List<Product> _menu = [];

  List<Product> _carrito = [];
  double _total = 0;

  List<Product> get menu => _menu;

  List<Product> get carrito => _carrito;

  bool isLoading = true;

  getMenu() async {
    var url = Uri.parse(baseURL + 'productos');
    final response = await http.get(url, headers: headers);
    print("HOLAAAAA");
    _menu = productoFromJson(response.body);
    isLoading = false;
    notifyListeners();
  }

  double getTotal() {
    double total = 0;
    for (var i = 0; i < carrito.length; i++) {
      total += double.parse(carrito[i].precio) * carrito[i].cantidad;
    }
    _total = total;
    notifyListeners();
    return _total;
  }

  // AGREGAR AL CARRITO

  void agregarACarrito(Product comidaItem, int cantidad) {
    comidaItem.setCantidad(cantidad);
    _carrito.add(comidaItem);

    notifyListeners();
  }

  int pos(List<Product> carrito, Product producto) {
    int pos = 0;
    for (var i = 0; i < carrito.length; i++) {
      if (carrito[i] == producto) pos = i;
    }
    notifyListeners();
    return pos;
  }

  // REMOVER DEL CARRITO
  void removerDCarrito(Product comidaItem) {
    comidaItem.cantidad = 0;
    _carrito.remove(comidaItem);
    _total = _total - comidaItem.cantidad * double.parse(comidaItem.precio);
    notifyListeners();
  }

  Future<void> pay() async {
    if (_carrito.isEmpty) return;
    Map data = {"productos": _carrito, "total": getTotal().toInt().toString()};

    String body = jsonEncode(data);
    var url = Uri.parse(baseURL + 'pedido');
    final token = await LocalStorage().getUserToken();
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    final response = await http.post(
      url,
      body: body,
      headers: header,
    );
    print(response.body);
    _carrito = [];
    notifyListeners();
  }
}
