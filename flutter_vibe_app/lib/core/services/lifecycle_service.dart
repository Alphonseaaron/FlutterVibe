import 'package:flutter/widgets.dart';

class LifecycleService extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // App is resumed
        break;
      case AppLifecycleState.inactive:
        // App is inactive
        break;
      case AppLifecycleState.paused:
        // App is paused
        break;
      case AppLifecycleState.detached:
        // App is detached
        break;
    }
  }
}
