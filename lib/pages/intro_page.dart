import 'package:e_comerce/components/button_intro.dart';
import 'package:e_comerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 50,
              ),
              // SHOP NAME
              Text(
                "FOGON VERDE",
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28, color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),

              // ICON
              Padding(
                  padding: const EdgeInsets.all(50),
                  child: Center(child: Image.asset('lib/images/icono.png'))),

              const SizedBox(
                height: 25,
              ),

              Text(
                "BIENVENIDO AL RESTAURANT EL FOGON VERDE",
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 44, color: Colors.white),
              ),

              const SizedBox(
                height: 25,
              ),

              Text(
                  "Somos el restaurante con una amplia diversidad de platos y promociones en el mercado  ",
                  style: TextStyle(
                      color: Colors.grey[300], height: 2, fontSize: 17)),
              const SizedBox(
                height: 25,
              ),
              MyButtonI(
                text: "COMERZAR ",
                onTap: () {
                  // IR A AL MENU
                  Navigator.pushNamed(context, '/menupage');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
