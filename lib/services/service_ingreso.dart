import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:visualizador_eventos/widgets/alert_widget.dart';
import '../user_preferences/user_preferences.dart';

class IngresoService {
  //clase de ingreso
  //creo diferntes metodos
  final prefs = PreferenciasUsuario();
  final ip =
      "http://sistemic.udea.edu.co:4000/reto"; //variable genreal, todas la apis tiene el mismo ip

  //servicios futuros pq tenes que esperar que la infromacion se envie
  Future<String> login(String usuario, String password) async {
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
        return decodedData["access_token"];
      } else {
        return "";
      }
    } catch (e) {
      return "Problemas con el servidor";
    }    
  }

  Future<bool> registro(String usuario, String password, String correo) async {
    //paso 1
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('$ip/usuarios/registro/enviar'));
    request.body = json
        .encode({"username": usuario, "password": password, "email": correo});
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return true;
        // print(await response.stream.bytesToString());
      } else {
        return false;
        // print(response.reasonPhrase);
      }
    } catch (e) {
      return false;
    }
  }
    

  Future<bool> otp(String code, String username) async{
    var request = http.MultipartRequest('POST', Uri.parse('$ip/usuarios/registro/confirmar/$username'));
    request.fields.addAll({
      'codigo': code
    });

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return true;
      }
      else {
        return false;
      }
    } catch (e) {
      return false;
    }
    
  }

  Future<bool> eliminar(String code, String username) async {
    var headers = {
  'Authorization': 'Bearer {{token}}'
    };
    var request = http.MultipartRequest('DELETE', Uri.parse('$ip/usuarios/usuarios/eliminar-prueba/$username'));
    request.fields.addAll({
      'code': code
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
      print(await response.stream.bytesToString());
    }
    else {
      return false;
      print(response.reasonPhrase);
    }

  }
}
