import 'package:flutter/material.dart';
import 'package:visualizador_eventos/widgets/vistaApp_widget.dart';

class VistaPage extends StatelessWidget {
  const VistaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(170, 24, 117, 209),
      body: VistaWidget());
  }
}