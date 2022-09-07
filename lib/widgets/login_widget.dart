import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visualizador_eventos/services/service_ingreso.dart';
import 'package:visualizador_eventos/widgets/ingresoDato_widget.dart';
import 'package:visualizador_eventos/widgets/tituloVista_widget.dart';
import 'package:visualizador_eventos/widgets/titulo_widget.dart';
import '../user_preferences/user_preferences.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciasUsuario();
    final ingresoServices = IngresoService();
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TituloVista(mensaje: 'Iniciar Sesión'),
                const TituloWidget(mensaje: 'Usuario', icono: Icon(Icons.person)),
                IngresoDato(varController: userController, autocorrector: false, ocultarTexto: false, mensaje: "Ingrese su usuario", tipoTeclado: TextInputType.text),
                const TituloWidget(mensaje: 'Contraseña', icono: Icon(Icons.lock)),
                IngresoDato(varController: passController, autocorrector: false, ocultarTexto: true, mensaje: "Ingrese su contraseña", tipoTeclado: TextInputType.visiblePassword),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 144, 202, 249)
                      ),
                      onPressed: (){
                        // ingresoServices.login(userController.text, passController.text);
                        Navigator.pushNamed(context, "vista");
                      },
                      child: const Text("Ingresar",
                      style: TextStyle(fontSize: 20),)),
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: (){
                          
                          Navigator.pushNamed(context, "register");
                        }, 
                        child: const Text(
                          "¿Aún no tienes una cuenta?",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),))
                    ],
                  )
          ],
        ),
      ),
    );
  }
}



