import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/shared/widgets/app_button.dart';
import 'package:flutter_vibe_app/shared/widgets/app_text_field.dart';
import 'package:provider/provider.dart';
import 'prompt_controller.dart';

class PromptScreen extends StatelessWidget {
  const PromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PromptController(),
      child: Consumer<PromptController>(
        builder: (context, controller, child) {
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('New App'),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppTextField(
                    placeholder: 'Enter your app idea...',
                    controller: controller.promptController,
                    maxLines: 10,
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    text: 'Generate App',
                    onPressed: () {
                      controller.generateApp(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
