import 'package:flutter/material.dart';

import '../theme/colors.dart';

class ReservaPage extends StatelessWidget {
  const ReservaPage({super.key});

  @override
  Widget build(BuildContext context) {
    List mesa = [1, 2, 3, 4, 5, 6];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 240, 240),
      appBar: AppBar(
        title: const Text("AGENDA TU RESERVA"),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Center(),
    );
  }
}
