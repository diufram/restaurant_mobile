//import 'package:e_comerce/auth/login_or_register.dart';
import 'package:e_comerce/auth/login_or_register.dart';
import 'package:e_comerce/data/respositories/compra_repository.dart';
import 'package:e_comerce/domain/models/carrito.dart';
import 'package:e_comerce/domain/models/reserva.dart';
import 'package:e_comerce/ui/pages/carrito_page.dart';
import 'package:e_comerce/ui/pages/compras_page.dart';
import 'package:e_comerce/ui/pages/intro_page.dart';

import 'package:e_comerce/ui/pages/menu_page.dart';
import 'package:e_comerce/ui/pages/reserva_page.dart';
import 'package:e_comerce/ui/pages/reserva_page_create.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Carrito(),
      ),
      ChangeNotifierProvider(
        create: (context) => Compra(),
      ),
      ChangeNotifierProvider(
        create: (context) => Reserva(),
      ),
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
      home: LoginOrRegister(), //
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/carritopage': (context) => const CarritoPage(),
        '/compraspage': (context) => const ComprasPage(),
        '/reservapage': (context) => const ReservaPage(),
        '/loginregister': (context) => const LoginOrRegister(),
        '/reservacreate': (context) => const ReservaCreatePage(),
      },
    );
  }
}
