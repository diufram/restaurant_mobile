import 'package:e_comerce/data/respositories/compras_respository.dart';
import 'package:e_comerce/models/compras.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';

class ComprasPage extends StatelessWidget {
  const ComprasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Compra>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 240, 240),
        appBar: AppBar(
          title: const Text("DETALLES DE LA COMPRA"),
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(child: Consumer<Compra>(
              builder: (context, value, child) {
                return ListView.builder(
                    itemCount: value.compras.length,
                    itemBuilder: (context, index) {
                      final Compras compra = value.compras[index];

                      final String id = compra.id.toString();

                      final String total = compra.total.toString();

                      final String fecha = compra.fecha.toString();

                      return ListTile(
                        title: Text(
                          'Compra: ' + id,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Fecha: ' +
                              fecha +
                              '\n' +
                              'Total: ' +
                              total +
                              ' BOB.' +
                              '\n' +
                              'Promocion:  No aplica Promocion' +
                              '\n' +
                              'Descuento: ' +
                              'Sin descuento ',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 19),
                        ),
                      );
                    });
              },
            )),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
