import 'package:flutter/material.dart';

class TituloVista extends StatelessWidget {
  const TituloVista({
    Key? key, required this.mensaje,
  }) : super(key: key);
  final String mensaje;

  @override
  Widget build(BuildContext context) {
    return Text(
      mensaje, 
      style: const TextStyle(
        color: Colors.white, 
        fontSize: 30, 
        fontWeight: FontWeight.bold),
        );
  }
}