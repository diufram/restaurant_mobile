import 'package:e_comerce/components/button_intro.dart';
import 'package:e_comerce/models/carrito.dart';
import 'package:e_comerce/pages/menu_page.dart';
import 'package:e_comerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class DetallesPageCarrito extends StatelessWidget {
  const DetallesPageCarrito({super.key});

  @override
  Widget build(BuildContext context) {
    final carrito = context.read<Carrito>();
    final String total = carrito.getTotal().toString();
    return Consumer<Carrito>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 240, 240),
        appBar: AppBar(
          title: const Text("DETALLES DE LA COMPRA"),
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.carrito.length,
                  itemBuilder: (context, index) {
                    final Product comida = value.carrito[index];

                    //
                    final String comidaNombre = comida.nombre;

                    //
                    final String comidaPrecio = comida.precio.toString();

                    final String comidaCantidad = comida.cantidad.toString();
                    final double comidaSubtotal =
                        comida.cantidad * double.parse(comida.precio);
                    return ListTile(
                      title: Text(
                        comidaNombre,
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Precio: ' +
                            comidaPrecio +
                            '\n' +
                            'Cantidad: ' +
                            comidaCantidad +
                            '\n' +
                            'Subtotal: ' +
                            comidaSubtotal.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 19),
                      ),
                    );
                  }),
            ),
            Center(
              child: Image.asset(
                "lib/images/qr.jpeg",
                height: 150,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'TOTAL: ' + total,
              textAlign: TextAlign.end,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButtonI(
                  text: "Pagar",
                  onTap: () {
                    carrito.pay();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuPage()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
