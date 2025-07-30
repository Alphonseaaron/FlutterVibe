import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LlmSettingsController extends ChangeNotifier {
  String _llmProvider = 'OpenAI';
  final apiKeyController = TextEditingController();

  String get llmProvider => _llmProvider;

  LlmSettingsController() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _llmProvider = prefs.getString('llm_provider') ?? 'OpenAI';
    apiKeyController.text = prefs.getString('api_key') ?? '';
    notifyListeners();
  }

  Future<void> setLlmProvider(String provider) async {
    _llmProvider = provider;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('llm_provider', provider);
    notifyListeners();
  }

  Future<void> saveApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('api_key', apiKeyController.text);
  }
}
