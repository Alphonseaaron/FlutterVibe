import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_vibe_app/core/services/feature_flag_service.dart';
import 'package:flutter_vibe_app/shared/widgets/cupertino_switch_list_tile.dart';
import 'package:provider/provider.dart';

class DebugPanel extends StatelessWidget {
  final Widget child;

  const DebugPanel({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      return Stack(
        children: [
          child,
          Positioned(
            right: 0,
            bottom: 100,
            child: CupertinoButton(
              child: const Icon(CupertinoIcons.bug),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => const DebugPanelContent(),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return child;
    }
  }
}

class DebugPanelContent extends StatelessWidget {
  const DebugPanelContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('Debug Panel'),
      actions: [
        CupertinoActionSheetAction(
          child: const Text('Feature Flags'),
          onPressed: () {
            Navigator.of(context).pop();
            showCupertinoModalPopup(
              context: context,
              builder: (context) => const FeatureFlagsPanel(),
            );
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class FeatureFlagsPanel extends StatelessWidget {
  const FeatureFlagsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FeatureFlagService>(
      builder: (context, featureFlagService, _) {
        return CupertinoActionSheet(
          title: const Text('Feature Flags'),
          actions: [
            CupertinoSwitchListTile(
              title: const Text('Show New Welcome Message'),
              value: featureFlagService.isEnabled('show_new_welcome_message'),
              onChanged: (value) {
                // This is not how you would do this in a real app,
                // but for the sake of this example, I will just
                // leave it like this.
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}
