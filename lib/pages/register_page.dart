import 'dart:convert';

import 'package:e_comerce/pages/intro_page.dart';
import 'package:flutter/material.dart';

import '../auth/login_or_register.dart';
import '../components/button.dart';
import '../components/text_field.dart';

import 'package:http/http.dart' as http;

import '../services/globals.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final telefonoController = TextEditingController();
  final direccionController = TextEditingController();
  final edadController = TextEditingController();

  void register() async {
    bool emailValido = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^ `{|}-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailTextController.text);
    if (emailValido) {
      http.Response response = await AuthServices.register(
          nameTextController.text,
          emailTextController.text,
          passwordTextController.text,
          telefonoController.text,
          direccionController.text,
          edadController.text);

      if (response.statusCode == 200) {
        Map responseMap = jsonDecode(response.body);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const IntroPage(),
            ));
      } else {
        errorSnackBar(context, 'responseMap.values.first[0]');
      }
    } else {
      errorSnackBar(context, 'EMAIL NO VALIDO');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LOGO
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  // MENSAJE DE BIENVENIDA
                  Text(
                    "Listo para crear tu cuenta",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // EMAIL TEXTFIELD
                  MyTextField(
                      controller: nameTextController,
                      hintText: 'Nombre',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),
                  // EMAIL TEXTFIELD
                  MyTextField(
                      controller: emailTextController,
                      hintText: 'Email',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  // PASSWORD TEXTFIELD
                  MyTextField(
                      controller: passwordTextController,
                      hintText: 'Passwrod',
                      obscureText: true),

                  const SizedBox(
                    height: 10,
                  ),

                  // TELEFONO TEXTFIELD
                  MyTextField(
                      controller: telefonoController,
                      hintText: 'Telefono',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  // DIRECCION TEXTFIELD

                  MyTextField(
                      controller: direccionController,
                      hintText: 'Direccion',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  // EDAD TEXTFIELD

                  MyTextField(
                      controller: edadController,
                      hintText: 'Edad',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // BOTON DE INICIO
                  MyButton(onTap: register, text: 'Registrate'),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ya tienes una cuenta?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Iniciar Session",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // IR A REGISTRO
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
