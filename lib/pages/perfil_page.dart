import 'package:flutter/material.dart';
import 'package:visualizador_eventos/widgets/perfil_widget.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(170, 24, 117, 209),
      body: Text("Su usuario se eliminó correctamente")
      // PerfilWidget()
    );
  }
}