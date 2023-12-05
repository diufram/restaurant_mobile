import 'package:e_comerce/components/button_intro.dart';
import 'package:e_comerce/domain/models/carrito.dart';
import 'package:e_comerce/ui/pages/detalles_pedido_page.dart';
import 'package:e_comerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/product.dart';

class CarritoPage extends StatelessWidget {
  const CarritoPage({super.key});

  void removerDCarrito(Product comida, BuildContext context) {
    final carrito = context.read<Carrito>();
    carrito.removerDCarrito(comida);
  }

  @override
  Widget build(BuildContext context) {
    // final carrito = context.read<Carrito>();
    return Consumer<Carrito>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: const Color.fromARGB(255, 241, 240, 240),
              appBar: AppBar(
                title: const Text("CARRITO"),
                backgroundColor: primaryColor,
                elevation: 0,
              ),
              body: Column(
                children: [
                  // CUSTOMER CART
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.carrito.length,
                      itemBuilder: (context, index) {
                        // TRAER
                        final Product comida = value.carrito[index];

                        //
                        final String comidaNombre = comida.nombre;

                        //
                        final String comidaPrecio = comida.precio.toString();
                        final String comidaCantidad =
                            comida.cantidad.toString();

                        //
                        return Container(
                          decoration: BoxDecoration(
                              color: otherColor,
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          child: ListTile(
                            title: Text(
                              comidaNombre,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Precio: ' +
                                  comidaPrecio +
                                  '\n' +
                                  'Cantidad: ' +
                                  comidaCantidad,
                              style: TextStyle(color: Colors.grey[200]),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.grey[300],
                              ),
                              onPressed: () {
                                removerDCarrito(comida, context);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // PROCEDER A PAGAR
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: MyButtonI(
                        text: "Pagar Ahora",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetallesPageCarrito()));
                        }),
                  )
                ],
              ),
            ));
  }
}
