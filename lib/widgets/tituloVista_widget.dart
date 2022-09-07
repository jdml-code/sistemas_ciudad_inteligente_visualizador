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
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white, 
        fontSize: 50, 
        fontWeight: FontWeight.bold),
        );
  }
}

