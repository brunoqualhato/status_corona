import 'package:statuscorona/models/estados.dart';
import 'package:statuscorona/models/paises.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
Future<List<Paises>> fechPaises(String api) async {
  ListaDePaises listaDePaises;
  var res = await http.get(api);
  var decodeRes = jsonDecode(res.body);
  listaDePaises= ListaDePaises.fromJson(decodeRes);
  return listaDePaises.paises;
}
Future<List<Estados>> fechEstados(String api) async {
  EstadoList listaDeEstados;
  var res = await http.get(api);
  var decodeRes = jsonDecode(res.body);
  listaDeEstados= EstadoList.fromJson(decodeRes);
  return listaDeEstados.estados;
}
