import 'package:e_comerce/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComidaTitulo extends StatelessWidget {
  final void Function()? onTap;
  final Producto comida;
  const ComidaTitulo({super.key, required this.comida, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 250,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              comida.imagenPath,
              height: 120,
            ),

            // TEXT
            Text(
              comida.nombre,
              style: GoogleFonts.dmSerifDisplay(fontSize: 20),
            ),
            SizedBox(
              width: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // PRECIO
                  Text(
                    '\$' + comida.precio.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[700]),
                  ),

                  // DESCRIPCION
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 255, 0),
                      ),
                      Text(
                        "5",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
