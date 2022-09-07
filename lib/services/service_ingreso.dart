import 'dart:convert';
import 'package:http/http.dart' as http;
import '../user_preferences/user_preferences.dart';

class IngresoService {
  //clase de ingreso
  //creo diferntes metodos
  final prefs = PreferenciasUsuario();
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
    try {
      http.StreamedResponse response = await request.send();
      final Map<String, dynamic> decodedData = json.decode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        prefs.token = decodedData["access_token"];
        print(prefs.token);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
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

  Future otp(String code, String username) async{
    var request = http.MultipartRequest('POST', Uri.parse('$ip/usuarios/registro/confirmar/$username'));
    request.fields.addAll({
      'codigo': code
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
}
