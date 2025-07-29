import 'package:flutter/cupertino.dart';

enum AppButtonStyle { primary, ghost, danger }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonStyle style;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.style = AppButtonStyle.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: text,
      button: true,
      child: () {
        switch (style) {
          case AppButtonStyle.primary:
            return CupertinoButton.filled(
              onPressed: onPressed,
              child: Text(text),
            );
          case AppButtonStyle.ghost:
            return CupertinoButton(
              onPressed: onPressed,
              child: Text(text),
            );
          case AppButtonStyle.danger:
            return CupertinoButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(color: CupertinoColors.destructiveRed),
              ),
            );
        }
      }(),
    );
  }
}
