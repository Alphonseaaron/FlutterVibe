import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final List<Map<String, dynamic>> _events = [];
  Timer? _timer;

  AnalyticsService() {
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      _sendBatch();
    });
  }

  FirebaseAnalyticsObserver getObserver() {
    return FirebaseAnalyticsObserver(analytics: _analytics);
  }

  Future<void> trackScreen(String screenName) async {
    await _analytics.setCurrentScreen(screenName: screenName);
  }

  Future<void> trackEvent(String eventName,
      {Map<String, dynamic>? parameters}) async {
    _events.add({
      'name': eventName,
      'parameters': parameters,
    });
  }

  Future<void> _sendBatch() async {
    if (_events.isEmpty) {
      return;
    }
    for (final event in _events) {
      await _analytics.logEvent(
        name: event['name'],
        parameters: event['parameters'],
      );
    }
    _events.clear();
  }

  void dispose() {
    _timer?.cancel();
  }
}
