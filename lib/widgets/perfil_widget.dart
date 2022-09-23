import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:visualizador_eventos/pages/login_page.dart';
import 'package:visualizador_eventos/services/service_ingreso.dart';
import 'package:visualizador_eventos/widgets/login_widget.dart';
import 'package:visualizador_eventos/widgets/tituloVista_widget.dart';
import 'package:visualizador_eventos/widgets/titulo_widget.dart';

import '../user_preferences/user_preferences.dart';


class PerfilWidget extends StatelessWidget {
  PerfilWidget({super.key});
  final prefs = PreferenciasUsuario;
  final ingresoServices = IngresoService();
  final TextEditingController userController = TextEditingController();
  final TextEditingController code = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    // final List<String> args = ModalRoute.of(context)?.settings.arguments as List<String>;
    // print(args);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TituloVista(mensaje: 'Perfil'),
                TituloWidget(mensaje: 'Usuario', icono: Icon(Icons.person)),
                // Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: SizedBox(
                //     child: ElevatedButton(
                //       onPressed: eliminarCuenta,
                //       child: Text("Eliminar cuenta",
                //       style: TextStyle(fontSize: 20),)),
                //   ),
                // )
          ]
        ),
      ),
    );
  }

  void eliminarCuenta() async {
                      final result = await ingresoServices.eliminar(userController.text, code.text);
                      if(result){
                        Fluttertoast.showToast(
                          msg: "Su cuenta ha sido eliminada con éxito",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.lightBlueAccent,
                          textColor: Colors.white,
                          fontSize: 16.0
                        );
                      }
                    }
}