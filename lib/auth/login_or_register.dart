import 'dart:convert';

import 'package:e_comerce/pages/login_page.dart';
import 'package:e_comerce/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/globals.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}

class AuthServices {
  static Future<http.Response> register(String name, String email,
      String password, String telefono, String direccion, String edad) async {
    Map data = {
      "nombre": name,
      "email": email,
      "password": password,
      "telefono": telefono,
      "direccion": direccion,
      "edad": edad,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    //print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }
}
