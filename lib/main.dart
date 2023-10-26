//import 'package:e_comerce/auth/login_or_register.dart';
import 'package:e_comerce/data/respositories/compras_respository.dart';
import 'package:e_comerce/models/carrito.dart';
import 'package:e_comerce/pages/carrito_page.dart';
import 'package:e_comerce/pages/compras_page.dart';
import 'package:e_comerce/pages/intro_page.dart';

import 'package:e_comerce/pages/menu_page.dart';
import 'package:e_comerce/pages/reserva_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Carrito(),
      ),
      ChangeNotifierProvider(create: (context) => Compra())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPage(), //
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/carritopage': (context) => const CarritoPage(),
        '/compraspage': (context) => const ComprasPage(),
        '/reservapage': (context) => const ReservaPage(),
      },
    );
  }
}
