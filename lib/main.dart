import 'dart:html';

import 'package:flutter/material.dart';
import 'package:visualizador_eventos/pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: "login",
      routes: {
        "login" :(context) => const LoginPage()
      },
    );

  }
}