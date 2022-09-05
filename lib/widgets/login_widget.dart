import 'package:flutter/material.dart';
import 'package:visualizador_eventos/widgets/tituloVista_widget.dart';
import 'package:visualizador_eventos/widgets/titulo_widget.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TituloVista(mensaje: 'Iniciar Sesión'),
                const TituloWidget(mensaje: 'Usuario', icono: Icon(Icons.person)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextField(
                    // onChanged: (value) {
                      // para no utilizar controller sino el value.
                      // se debe asignar a una variable
                    // },
                    autocorrect: false,
                    controller: userController,
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(255, 195, 253, 255),
                      filled: true,
                      // prefix: Icon(Icons.person, color: Colors.black,),
                      border: OutlineInputBorder(),
                      hintText: "Ingrese su usuario"
                      // labelText: "Ingrese su usuario"

                    ),
                  ),
                ),
                const TituloWidget(mensaje: 'Contraseña', icono: Icon(Icons.lock)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextField(
                    controller: passController,
                    obscureText: true, //ocultar contraseña
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(255, 195, 253, 255),
                      filled: true,
                      prefix: Icon(Icons.lock, color: Colors.black,),
                      border: OutlineInputBorder(),
                      labelText: "Ingrese su contraseña"
                    ),
                  ),
                ),
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



