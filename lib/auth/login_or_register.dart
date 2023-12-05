import 'dart:convert';

import 'package:e_comerce/data/respositories/local_repository.dart';
import 'package:e_comerce/domain/response/login_response.dart';
import 'package:e_comerce/ui/pages/intro_page.dart';
import 'package:e_comerce/ui/pages/login_page.dart';
import 'package:e_comerce/ui/pages/register_page.dart';
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

  bool isToken = false;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  Future<void> getToken() async {
    final token = await LocalStorage().getUserToken();
    print(token);
    if (token.toString() != "null") {
      toggleToken();
    }
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  void toggleToken() {
    setState(() {
      isToken = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isToken) {
      return IntroPage();
    } else if (showLoginPage) {
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
    final login = loginResponseFromJson(response.body);

    LocalStorage().setUserToken(login.accessToken.toString());
    Future.delayed(Duration(seconds: 2));
    print(await LocalStorage().getUserToken());
    return response;
  }
}
