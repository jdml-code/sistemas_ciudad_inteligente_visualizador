// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();
  late SharedPreferences _prefs;
  initPrefs() async{
    _prefs = await SharedPreferences.getInstance();
  }

  set token(String value){
    _prefs.setString('token', value);
  }

  String get token{
    return _prefs.getString('token') ?? "";
  }

  set position(List<String> value){
    _prefs.setStringList("position", value);
    
  }
  List<String> get position{
    return _prefs.getStringList("position") ?? [];
  }

}