import 'package:e_comerce/data/respositories/local_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/compras.dart';
import '../../services/globals.dart';

class Compra extends ChangeNotifier {
  List<Compras> _compras = [];

  List<Compras> get compras => _compras;

  getCompras() async {
    const url1 = baseURL + 'compras';
    final token = await LocalStorage().getUserToken();
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    final url = Uri.parse(url1);
    final response = await http.get(url, headers: header);
    _compras = comprasFromJson(response.body);
    notifyListeners();
  }
}
