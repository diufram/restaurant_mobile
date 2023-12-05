import 'package:e_comerce/domain/models/reserva.dart';
import 'package:e_comerce/domain/models/reservas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/button_intro.dart';
import '../../theme/colors.dart';

class ReservaPage extends StatefulWidget {
  const ReservaPage({super.key});

  @override
  State<ReservaPage> createState() => _ReservaPageState();
}

class _ReservaPageState extends State<ReservaPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Reserva>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 240, 240),
        appBar: AppBar(
          title: const Text("RESERVAS"),
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Consumer<Reserva>(
                      builder: (context, value, child) {
                        return ListView.builder(
                            itemCount: value.reservas.length,
                            itemBuilder: (context, index) {
                              print(value.reservas);
                              final Reservas reserva = value.reservas[index];

                              final String id = reserva.id.toString();

                              final String hora = reserva.hora.toString();

                              final String fecha = reserva.fecha.toString();

                              return ListTile(
                                title: Text(
                                  'Reserva: ' + id,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'Fecha: ' +
                                      fecha +
                                      '\n' +
                                      'Hora: ' +
                                      hora +
                                      '\n',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 19),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                  MyButtonI(
                      onTap: () {
                        Navigator.pushNamed(context, '/reservacreate');
                      },
                      text: "Realice una Reserva")
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
