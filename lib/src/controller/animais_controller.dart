import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/animais_model.dart';

const String url = "http://my-json-server.typicode.com/belmondo/fakedb/db";

List<Animais> parseAnimais(String respondeBody) {
  var list = json.decode(respondeBody) as List<dynamic>;
  var animais = list.map((e) => Animais.fromJson(e)).toList();
  return animais;
}

Future<List<Animais>> fetchanimais() async {
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print(response.statusCode);
    print(response.body);
    return compute(parseAnimais, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
