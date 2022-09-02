import 'package:flutter/material.dart';
import '../widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(170, 24, 117, 209),
      body: LoginWidget());
  }
}

