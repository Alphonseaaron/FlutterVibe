import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_vibe_app/core/services/firebase_config.dart';

class ConfigService {
  static Map<String, dynamic>? _config;

  static Future<void> load(String env) async {
    final configString = await rootBundle.loadString('config/$env.json');
    _config = json.decode(configString);
    await FirebaseConfig.load();
  }

  static String get apiUrl {
    return _config?['api_url'];
  }
}
