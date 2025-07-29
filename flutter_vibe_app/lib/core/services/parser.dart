import 'dart:convert';
import 'package:flutter/foundation.dart';

Future<dynamic> parseJson(String jsonString) {
  return compute(_parseJson, jsonString);
}

dynamic _parseJson(String jsonString) {
  return jsonDecode(jsonString);
}
