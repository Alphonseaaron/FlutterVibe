import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/motion_service.dart';
import 'package:flutter_vibe_app/localization/localization_service.dart';
import 'package:flutter_vibe_app/modules/settings/llm_settings_screen.dart';
import 'package:flutter_vibe_app/shared/widgets/cupertino_switch_list_tile.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: Consumer2<MotionService, LocalizationService>(
        builder: (context, motionService, localizationService, child) {
          return ListView(
            children: [
              CupertinoSwitchListTile(
                title: const Text('Reduce Motion'),
                value: motionService.reduceMotion,
                onChanged: (value) {
                  motionService.setReduceMotion(value);
                },
              ),
              CupertinoListTile(
                title: const Text('Language'),
                trailing: Text(localizationService.locale.languageCode),
                onTap: () {
                  _showLanguagePicker(context, localizationService);
                },
              ),
              CupertinoListTile(
                title: const Text('LLM Settings'),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => const LlmSettingsScreen(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _showLanguagePicker(
      BuildContext context, LocalizationService localizationService) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: CupertinoPicker(
            itemExtent: 32,
            onSelectedItemChanged: (index) {
              localizationService.setLocale(
                  index == 0 ? const Locale('en') : const Locale('sw'));
            },
            children: const [
              Text('English'),
              Text('Swahili'),
            ],
          ),
        );
      },
    );
  }
}
