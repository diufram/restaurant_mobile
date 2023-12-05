import 'package:e_comerce/components/button_intro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/reserva.dart';
import '../../theme/colors.dart';

class ReservaCreatePage extends StatefulWidget {
  const ReservaCreatePage({super.key});

  @override
  State<ReservaCreatePage> createState() => _ReservaCreatePageState();
}

class _ReservaCreatePageState extends State<ReservaCreatePage> {
  @override
  Widget build(BuildContext context) {
    final reserva = context.read<Reserva>();
    return Consumer<Reserva>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 241, 240, 240),
          appBar: AppBar(
            title: const Text("REALIZE SU RESERVA"),
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
                        child: Column(
                      children: [
                        DropdownButton<String>(
                          value: reserva.horarioSelected,
                          hint: reserva.horarioSelected == null
                              ? Text(
                                  "Selecciona un horario",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                )
                              : Text(reserva.horarioSelected.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black)),
                          elevation: 15,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            // This is called when the user selects an item.
                            setState(() {
                              reserva.horarioSelected = value;
                            });
                          },
                          items: value.horarios.map((value) {
                            return DropdownMenuItem<String>(
                              value: value.hora,
                              child: Text(value.hora),
                            );
                          }).toList(),
                        ),

                        /*
                        DropdownButton<String>(
                          value: reserva.mesaSelected,
                          hint: reserva.mesaSelected == null
                              ? Text(
                                  "Selecciona una mesa",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                )
                              : Text(reserva.mesaSelected.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black)),
                          elevation: 15,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (value) {
                            // This is called when the user selects an item.
                            setState(() {
                              reserva.mesaSelected = value;
                            });
                          },
                          items: value.mesas.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                        ),
                        */
                        reserva.dateTime == null
                            ? Text("SELECCIONA UNA FECHA")
                            : Text(
                                reserva.dateTime.toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025),
                            ).then((val) {
                              setState(() {
                                value.dateTime = val;
                              });
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: secundaryColor,
                                borderRadius: BorderRadius.circular(40)),
                            padding: const EdgeInsets.all(20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Selecciona una Fecha",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ]),
                          ),
                        )
                      ],
                    )),
                    MyButtonI(
                        text: "Confirmar Reserva",
                        onTap: () {
                          value.addReserva();
                          Navigator.pushNamed(context, '/menupage');
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
