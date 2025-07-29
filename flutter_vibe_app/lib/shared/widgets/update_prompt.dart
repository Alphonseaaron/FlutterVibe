import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/version_service.dart';
import 'package:provider/provider.dart';

class UpdatePrompt extends StatelessWidget {
  final Widget child;

  const UpdatePrompt({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<VersionService>(
      builder: (context, versionService, _) {
        if (versionService.isUpdateAvailable) {
          return CupertinoAlertDialog(
            title: const Text('Update Available'),
            content: Text(
                'A new version (${versionService.latestVersion}) is available. Please update to continue.'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Update'),
                onPressed: () {
                  // Open app store
                },
              ),
            ],
          );
        } else {
          return child;
        }
      },
    );
  }
}
