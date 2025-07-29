import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FeatureFlagService extends ChangeNotifier {
  Map<String, bool> _featureFlags = {};

  Future<void> load() async {
    try {
      final response = await http.get(Uri.parse('YOUR_FEATURE_FLAG_URL_HERE'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        _featureFlags = json.map((key, value) => MapEntry(key, value as bool));
      }
    } catch (_) {
      // Use default feature flags
    }
    notifyListeners();
  }

  bool isEnabled(String key) {
    return _featureFlags[key] ?? false;
  }
}
