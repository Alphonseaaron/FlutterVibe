import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class LocalizationService extends ChangeNotifier {
  Locale _locale = const Locale('en');
  Map<String, String> _localizedStrings = {};

  Locale get locale => _locale;

  Future<void> load() async {
    final lang = _locale.languageCode;
    final jsonString =
        await rootBundle.loadString('assets/translations/$lang.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    notifyListeners();
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  void setLocale(Locale locale) {
    _locale = locale;
    load();
  }
}
