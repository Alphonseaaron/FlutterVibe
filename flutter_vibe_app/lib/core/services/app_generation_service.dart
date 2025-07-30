import 'package:dart_openai/dart_openai.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppGenerationService {
  Future<String> generateApp(String prompt) async {
    final prefs = await SharedPreferences.getInstance();
    final llmProvider = prefs.getString('llm_provider') ?? 'OpenAI';
    final apiKey = prefs.getString('api_key');

    if (apiKey == null) {
      throw Exception('API key not found');
    }

    if (llmProvider == 'OpenAI') {
      OpenAI.apiKey = apiKey;
      final completion = await OpenAI.instance.completion.create(
        model: "text-davinci-003",
        prompt: "Generate a Flutter app with the following description: $prompt",
      );
      return completion.choices.first.text;
    } else {
      // TODO: Implement Google LLM
      throw UnimplementedError('Google LLM not implemented');
    }
  }
}
