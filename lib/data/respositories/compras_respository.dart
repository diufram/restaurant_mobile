import 'package:e_comerce/models/compras.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../services/globals.dart';

class Compra extends ChangeNotifier {
  List<Compras> _compras = [];

  List<Compras> get compras => _compras;

  getCompras() async {
    const url1 = baseURL + 'compras';
    print(url1);
    final url = Uri.parse(url1);
    final response = await http.get(url, headers: headers);
    _compras = comprasFromJson(response.body);
    notifyListeners();
  }
}
