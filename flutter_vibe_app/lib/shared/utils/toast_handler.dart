import 'package:flutter/cupertino.dart';

enum ToastLevel { info, success, warning, error }

void showToast({
  required BuildContext context,
  required String message,
  ToastLevel level = ToastLevel.info,
}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 50.0,
      left: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.8,
      child: CupertinoPopupSurface(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _getTextColor(level),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}

Color _getBackgroundColor(ToastLevel level) {
  switch (level) {
    case ToastLevel.info:
      return CupertinoColors.systemGrey;
    case ToastLevel.success:
      return CupertinoColors.systemGreen;
    case ToastLevel.warning:
      return CupertinoColors.systemYellow;
    case ToastLevel.error:
      return CupertinoColors.destructiveRed;
  }
}

Color _getTextColor(ToastLevel level) {
  switch (level) {
    case ToastLevel.info:
    case ToastLevel.success:
    case ToastLevel.error:
      return CupertinoColors.white;
    case ToastLevel.warning:
      return CupertinoColors.black;
  }
}
