import 'package:e_comerce/components/button_intro.dart';
import 'package:e_comerce/models/carrito.dart';
import 'package:e_comerce/models/producto.dart';
import 'package:e_comerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetallesComida extends StatefulWidget {
  final Producto comida;
  const DetallesComida({super.key, required this.comida});

  @override
  State<DetallesComida> createState() => _DetallesComidaState();
}

class _DetallesComidaState extends State<DetallesComida> {
  // CANTIDAD
  int contadorCantidad = 0;

  // DECREMENTAR cantidad
  void decrementarCantidad() {
    setState(() {
      if (contadorCantidad > 0) {
        contadorCantidad--;
      }
    });
  }
  // INCREMENTAR CANTIDAD

  void incrementarCantidad() {
    setState(() {
      contadorCantidad++;
    });
  }

  void agregarACarrito() {
    // SOLO AGREGAR SI ESTE ESTA EN EL CARRITO
    if (contadorCantidad > 0) {
      // ACCEDER AL CARRITO
      final carrito = context.read<Carrito>();
      // AÑADIR AL CARRITO
      carrito.agregarACarrito(widget.comida, contadorCantidad);
      // INFORMAR QUE SE AÑADIO AL CARRITO
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Agregado al carrito!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            // OKEY BUTTON
            IconButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(children: [
        //LIST VIEW DE LOS DETALLES DE LA COMIDA
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView(
            children: [
              // IMAGEN
              Image.asset(
                widget.comida.imagenPath,
                height: 300,
              ),

              const SizedBox(
                height: 25,
              ),

              Row(
                children: [
                  // ESTRELLA ICONO
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),

                  const SizedBox(
                    width: 5,
                  ),

                  Text(
                    "5",
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              // NOMBRE
              Text(
                widget.comida.nombre,
                style: GoogleFonts.dmSerifDisplay(fontSize: 35),
              ),
              const SizedBox(
                height: 25,
              ),

              // DESCRIPCION

              Text(
                "Descripcion",
                style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),

              const SizedBox(
                height: 10,
              ),
              Text(
                widget.comida.descripcion,
                style:
                    TextStyle(color: Colors.grey[600], fontSize: 15, height: 2),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        )),

        // PRECIO + CANTIDAD + AÑADIR AL CARRITO BOTON
        Container(
          color: primaryColor,
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            // PRECIO + CANTIDAD
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PRECIO
                Text(
                  '\$' + widget.comida.precio.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),

                // CANTIDAD
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    // - BOTON
                    Container(
                      decoration: BoxDecoration(
                          color: secundaryColor, shape: BoxShape.circle),
                      child: IconButton(
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: decrementarCantidad,
                      ),
                    ),

                    // CANTIDAD
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          contadorCantidad.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),

                    // + BOTON
                    Container(
                      decoration: BoxDecoration(
                          color: secundaryColor, shape: BoxShape.circle),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: incrementarCantidad,
                      ),
                    )

                    // + BOTON
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),

            // AÑADIR AL CARRITO

            MyButtonI(text: "Anadir al Carrito", onTap: agregarACarrito)
          ]),
        )
      ]),
    );
  }
}
