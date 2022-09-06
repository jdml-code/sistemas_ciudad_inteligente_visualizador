import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:visualizador_eventos/widgets/tituloVista_widget.dart';
import 'package:visualizador_eventos/widgets/titulo_widget.dart';
import '../services/service_ingreso.dart';
import 'ingresoDato_widget.dart';

class OTPWidget extends StatelessWidget {
  const OTPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ingresoService = IngresoService();
    final List<String> args = ModalRoute.of(context)?.settings.arguments as List<String>;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        //ayuda a auna mejor viazualicaion en celular
        child: SizedBox(
          height: MediaQuery.of(context)
              .size
              .height, //reconoce el alto del dispositivo
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TituloVista(mensaje: 'Ingrese el código de verificación'),
              Text("El código de verificación fue enviado al correo: ${args[1]}"),
              OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width - 20,
              fieldWidth: 40,
              style: const TextStyle(
                fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                ingresoService.otp(pin, args[0]);
                Navigator.pushNamed(context, "login");
              }
            ),
            ],
          ),
        ),
      ),
    );
  }
}