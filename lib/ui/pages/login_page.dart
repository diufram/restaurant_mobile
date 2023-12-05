import 'package:e_comerce/components/button.dart';
import 'package:e_comerce/components/text_field.dart';
import 'package:e_comerce/ui/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../auth/login_or_register.dart';
import '../../services/globals.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void iniciarSession() async {
    if (emailTextController.text != "" && passwordTextController.text != "") {
      http.Response response = await AuthServices.login(
          emailTextController.text, passwordTextController.text);

      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => IntroPage(),
            ));
      } else {
        errorSnackBar(context, 'INGRESE LOS DATOS CORRECTOS');
      }
    } else {
      errorSnackBar(context, 'TODOS LOS CAMPOS SON REQUERIDOS');
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LOGO
                  Image.asset("lib/images/icono.png"),

                  const SizedBox(
                    height: 50,
                  ),

                  // MENSAJE DE BIENVENIDA
                  Text(
                    "Bienvenido de nuevo ",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 25,
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
                    height: 25,
                  ),
                  // BOTON DE INICIO DE SESSION
                  MyButton(onTap: iniciarSession, text: 'Iniciar Session'),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No tienes una cuenta aun?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Registrate Ahora",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      )
                    ],
                  )
                  // IR A REGISTRO
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
