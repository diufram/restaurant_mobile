import 'package:e_comerce/domain/models/horario.dart';
import 'package:e_comerce/domain/models/reservas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/respositories/local_repository.dart';
import '../../services/globals.dart';

class Reserva extends ChangeNotifier {
  List<String> mesas = [];
  List<String> mesas1 = ["1", "2"];
  List<String> mesas2 = ["1", "2", "3"];
  List<int> cantMesa = [10, 10, 10, 10];
  List<Horario> horarios = [];

  List<Reservas> reservas = [];

  DateTime? dateTime;
  String? mesaSelected;
  String? horarioSelected;

  getReservas() async {
    print("HOLA");
    const url1 = baseURL + 'reservas';
    final token = await LocalStorage().getUserToken();
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    final url = Uri.parse(url1);
    final response = await http.get(url, headers: header);
    reservas = reservasFromJson(response.body);
    // reservas
    final url11 = Uri.parse(baseURL + 'horarios');
    final res = await http.get(url11, headers: header);
    horarios = horarioFromJson(res.body);
    print("HOLA");
    notifyListeners();
  }

  getHorarioId() {
    for (var i = 0; i < horarios.length; i++) {
      if (horarioSelected == horarios[i].hora) {
        return horarios[i].id;
      }
    }
  }

  addReserva() async {
    final token = await LocalStorage().getUserToken();
    final url = Uri.parse(baseURL + 'reservacreate');
    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    print(getHorarioId());
    Map body = {
      "hora": getHorarioId().toString(),
      "fecha": dateTime.toString()
    };
    await http.post(url, headers: header, body: body);
  }
}
/*
class Horarios {
  int id;
  DateTime horario;
  int cantidad;
}
*/