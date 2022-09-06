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
    _prefs.setString('toker', value);
  }

  String get token{
    return _prefs.getString('token') ?? "";
  }
}