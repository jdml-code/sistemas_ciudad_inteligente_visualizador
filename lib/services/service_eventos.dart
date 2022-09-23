import 'dart:convert';

import 'package:http/http.dart' as http;

import '../user_preferences/user_preferences.dart';


class Eventos {
  List<dynamic> eventos = [];
  final pref = PreferenciasUsuario();
  final ip =
      "http://sistemic.udea.edu.co:4000/reto";

  Future<List<dynamic>> listarEventos () async {
    // print(pref.token);
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NjMzMjQzNDksInVzZXJfbmFtZSI6Imp1YW4iLCJhdXRob3JpdGllcyI6WyJST0xFX1VTRVIiXSwianRpIjoiYTI1MzNkYWEtZjAzYy00NTc4LWIwNDItN2ZmOWEwMzNjNTQzIiwiY2xpZW50X2lkIjoiZmx1dHRlci1yZXRvIiwic2NvcGUiOlsicmVhZCIsIndyaXRlIl19.DnaanG8pnvocAx8k44Zf3UtEaEduxTa8e6ixmkyHErw',
      'Cookie': 'color=rojo'
    };
    var request = http.Request('GET', Uri.parse('http://sistemic.udea.edu.co:4000/reto/events/eventos/listar'));

    request.headers.addAll(headers);

    try {
      // print("Hola Eventos");
      http.StreamedResponse response = await request.send();
      // print("HTTP");
      final decodedData = json.decode(await response.stream.bytesToString());
      // print("Response");
      // print(decodedData);
      if (response.statusCode == 200) {
        // Crear un mapa 
        eventos[0] = decodedData[0]["date"];
        eventos[1] = decodedData[0]["time"];
        eventos[2] = decodedData[0]["eventDescription"];
        eventos[3] = decodedData[0]["location"];
        eventos[4] = decodedData[0]["comment"];
        eventos[5] = decodedData[0]["userId"];
        return eventos;
      }
      else {
        return eventos = [];
      }
    } catch (e) {
      // print(e);
      return eventos = [];
    }
    

  }
}