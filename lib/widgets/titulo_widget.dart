import 'package:flutter/material.dart';


class TituloWidget extends StatelessWidget {
  const TituloWidget({
    Key? key, required this.mensaje, required this.icono,
  }) : super(key: key);
  final String mensaje;
  final Icon icono;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children:[
          icono,
          Text(mensaje, 
          style: const TextStyle(color: Colors.white,
          fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
