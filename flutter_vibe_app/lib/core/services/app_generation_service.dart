import 'package:dart_openai/dart_openai.dart';

class AppGenerationService {
  Future<String> generateApp(String prompt) async {
    OpenAI.apiKey = 'YOUR_OPENAI_API_KEY';
    final completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",
      prompt: "Generate a Flutter app with the following description: $prompt",
    );
    return completion.choices.first.text;
  }
}
