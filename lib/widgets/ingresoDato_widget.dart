import 'package:flutter/material.dart';

class IngresoDato extends StatelessWidget {
  const IngresoDato({
    Key? key,
    required this.varController, required this.autocorrector, required this.ocultarTexto, required this.mensaje, required this.tipoTeclado,
  }) : super(key: key);

  final TextEditingController varController;
  final bool autocorrector;
  final bool ocultarTexto;
  final String mensaje;
  final TextInputType tipoTeclado;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 40.0, vertical: 10.0),
      child: TextField(
          autocorrect: autocorrector,
          obscureText: ocultarTexto,
          controller: varController,
          keyboardType: tipoTeclado,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 195, 253, 255),
            filled: true,
            border: const OutlineInputBorder(),
            hintText: mensaje,
          )
      ),
    );
  }
}
