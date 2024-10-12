import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:appflutter/models/noticias_model.dart';

class NoticiasProvider {
  // Funcion que retorna listado de Noticias
  Future<List<Datum>> fetchNews() async {
    String jsonString =
        await rootBundle.loadString('assets/json/example_json.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> data = jsonData['data'];
    await Future.delayed(const Duration(seconds: 1));
    return data.map((item) => Datum.fromJson(item)).toList();
  }
}
