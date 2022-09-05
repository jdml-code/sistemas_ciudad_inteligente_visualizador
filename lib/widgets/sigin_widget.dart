import 'package:flutter/material.dart';
import 'package:visualizador_eventos/widgets/tituloVista_widget.dart';
import 'package:visualizador_eventos/widgets/titulo_widget.dart';
import '../services/service_ingreso.dart';
import 'ingresoDato_widget.dart';

class SPage extends StatelessWidget {
  const SPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(170, 24, 117, 209),
        body: SiginWidget());
  }
}

class SiginWidget extends StatelessWidget {
  SiginWidget({super.key});

  //crear funciones globales para recibir la informacion

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController confirmar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ingresoService = IngresoService();
    return SafeArea(
      child: SingleChildScrollView(
        //ayuda a auna mejor viazualicaion en celular
        child: SizedBox(
          height: MediaQuery.of(context)
              .size
              .height, //reconoce el alto del dispositivo
          width: double.infinity,
          child: Column(
            children: [
              const TituloVista(mensaje: 'Registrarse'),
              const TituloWidget(mensaje: 'Nombre', icono: Icon(Icons.person)),
              IngresoDato(varController: userController, autocorrector: false, ocultarTexto: false, mensaje: "Ingrese su nombre", tipoTeclado: TextInputType.text),
              const TituloWidget(mensaje: 'Correo', icono: Icon(Icons.mail)),
              IngresoDato(varController: correoController, autocorrector: false, ocultarTexto: false, mensaje: "Ingrese su correo", tipoTeclado: TextInputType.emailAddress),
              const TituloWidget(mensaje: 'Contraseña', icono: Icon(Icons.password)),
              IngresoDato(varController: passController, autocorrector: false, ocultarTexto: true, mensaje: "Ingrese su contraseña", tipoTeclado: TextInputType.visiblePassword),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 144, 202, 249)),
                        onPressed: () {
                          ingresoService.registro(userController.text,
                              passController.text, correoController.text);
                        },
                        child: const Text("Crear cuenta",
                        style: TextStyle(fontSize: 20),)),
                  )),

              Row(
                //fila
                mainAxisAlignment: MainAxisAlignment.center, //para centralo
                children: [
                  const Text(
                    "Ya tengo una cuenta",
                    style: TextStyle(color: Colors.white, fontSize: 20, 
                            fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context,
                          "login"); //pop me devuelve a la pagina anterior
                    },
                    child: const Text("Ingresar",
                        style: TextStyle(
                            color: Color.fromARGB(255, 144, 202, 249),
                            fontSize: 30,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}