import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/shared/widgets/app_text_field.dart';
import 'package:flutter_vibe_app/shared/widgets/cupertino_list_tile.dart';
import 'package:provider/provider.dart';
import 'firebase_settings_controller.dart';

class FirebaseSettingsScreen extends StatelessWidget {
  const FirebaseSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FirebaseSettingsController(),
      child: Consumer<FirebaseSettingsController>(
        builder: (context, controller, child) {
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Firebase Settings'),
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppTextField(
                    placeholder: 'API Key',
                    controller: controller.apiKeyController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppTextField(
                    placeholder: 'App ID',
                    controller: controller.appIdController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppTextField(
                    placeholder: 'Messaging Sender ID',
                    controller: controller.messagingSenderIdController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppTextField(
                    placeholder: 'Project ID',
                    controller: controller.projectIdController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppTextField(
                    placeholder: 'Auth Domain',
                    controller: controller.authDomainController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppTextField(
                    placeholder: 'Storage Bucket',
                    controller: controller.storageBucketController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppTextField(
                    placeholder: 'iOS Bundle ID',
                    controller: controller.iosBundleIdController,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
