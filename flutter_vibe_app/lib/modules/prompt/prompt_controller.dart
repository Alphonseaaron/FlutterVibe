import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/app_generation_service.dart';
import 'package:flutter_vibe_app/modules/preview/preview_screen.dart';

class PromptController extends ChangeNotifier {
  final promptController = TextEditingController();
  final _appGenerationService = AppGenerationService();

  Future<void> generateApp(BuildContext context) async {
    final code = await _appGenerationService.generateApp(promptController.text);
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) =>
            PreviewScreen(code: code, prompt: promptController.text),
      ),
    );
  }
}
