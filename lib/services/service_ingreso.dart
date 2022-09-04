import 'dart:convert';

import 'package:http/http.dart' as http;

class IngresoService {
  //clase de ingreso
  //creo diferntes metodos
  final ip =
      "http://sistemic.udea.edu.co:4000/reto"; //variable genreal, todas la apis tiene el mismo ip

  //servicios futuros pq tenes que esperar que la infromacion se envie
  Future login(String usuario, String password) async {
    var headers = {
      'Authorization': 'Basic Zmx1dHRlci1yZXRvOnVkZWE=',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request =
        http.Request('POST', Uri.parse('$ip/autenticacion/oauth/token'));
    request.bodyFields = {
      'username': usuario,
      'password': password,
      'grant_type': 'password'
    };
    request.headers.addAll(headers);

    //si el servicio se cae TRY C
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future registro(String usuario, String password, String correo) async {
    //paso 1
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('$ip/usuarios/registro/enviar'));
    request.body = json
        .encode({"username": usuario, "password": password, "email": correo});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    //paso 2 confirmar con codigo al correo de verificaión
  }
}
