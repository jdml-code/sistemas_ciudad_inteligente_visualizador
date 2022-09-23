import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:visualizador_eventos/widgets/tituloVista_widget.dart';
import '../services/service_ingreso.dart';


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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TituloVista(mensaje: 'Ingrese el código de verificación'),
              const SizedBox(height: 25,),
              Text("El código de verificación fue enviado al correo: ${args[1]}"),
              OTPTextField(
                otpFieldStyle: OtpFieldStyle(borderColor: Colors.white,
                enabledBorderColor: Colors.white, disabledBorderColor: Colors.white,
                focusBorderColor: Colors.white),
              length: 6,
              width: MediaQuery.of(context).size.width - 20,
              fieldWidth: 40,
              style: const TextStyle(
                fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) async {
                final result = await ingresoService.otp(pin, args[0]);
                if(result){
                  Navigator.pushNamed(context, "login");
                }
                else{
                  Fluttertoast.showToast(
                            msg: "El código no corresponde al enviado",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightBlueAccent,
                            textColor: Colors.white,
                            fontSize: 16.0
                          );
                  Navigator.pushNamed(context, "otp");
                }
                
              }
            ),
            ],
          ),
        ),
      ),
    );
  }
}