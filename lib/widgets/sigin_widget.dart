import 'package:flutter/material.dart';

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
  final TextEditingController correocontroller = TextEditingController();
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
              const Text(
                "Registrate",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 2.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(children: const [
                      Icon(Icons.person, color: Colors.black),
                      Text("Nombre", style: TextStyle(color: Colors.white)),
                    ])),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 10.0),
                child: TextField(
                  controller: userController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese su nombre"),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 2.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(children: const [
                      Icon(Icons.mail, color: Colors.black),
                      Text("Correo", style: TextStyle(color: Colors.white)),
                    ])),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 10.0),
                child: TextField(
                  //onChanged: (value){
                  // },
                  //se usa normalmente como buscador mientras la persona va escribien el va buscando
                  //tambien para guardar el valor en una variable

                  controller: correocontroller,
                  obscureText: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese su correo"),
                ),
              ), //texto //texto

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 2.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(children: const [
                      Icon(Icons.password, color: Colors.black),
                      Text("Contraseña", style: TextStyle(color: Colors.white)),
                    ])),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 10.0),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  controller: passController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Cree su contraseña"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 2.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(children: const [
                      Icon(Icons.password, color: Colors.black),
                      Text("Confirmar", style: TextStyle(color: Colors.white)),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 10.0),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  controller: confirmar,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirma Contraseña"),
                ),
              ),

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
                              passController.text, correocontroller.text);
                        },
                        child: const Text("Crear cuenta")),
                  )),

              Row(
                //fila
                mainAxisAlignment: MainAxisAlignment.center, //para centralo
                children: [
                  const Text(
                    "Ya tengo cuenta",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
