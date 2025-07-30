import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/shared/widgets/app_text_field.dart';
import 'package:flutter_vibe_app/shared/widgets/cupertino_list_tile.dart';
import 'package:provider/provider.dart';
import 'llm_settings_controller.dart';

class LlmSettingsScreen extends StatelessWidget {
  const LlmSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LlmSettingsController(),
      child: Consumer<LlmSettingsController>(
        builder: (context, controller, child) {
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('LLM Settings'),
            ),
            child: ListView(
              children: [
                CupertinoListTile(
                  title: const Text('LLM Provider'),
                  trailing: Text(controller.llmProvider),
                  onTap: () {
                    _showLlmProviderPicker(context, controller);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppTextField(
                    placeholder: 'API Key',
                    controller: controller.apiKeyController,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showLlmProviderPicker(
      BuildContext context, LlmSettingsController controller) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: CupertinoPicker(
            itemExtent: 32,
            onSelectedItemChanged: (index) {
              controller
                  .setLlmProvider(index == 0 ? 'OpenAI' : 'Google');
            },
            children: const [
              Text('OpenAI'),
              Text('Google'),
            ],
          ),
        );
      },
    );
  }
}
