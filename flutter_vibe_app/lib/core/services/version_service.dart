import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VersionService extends ChangeNotifier {
  String? _latestVersion;
  String? _currentVersion;

  String? get latestVersion => _latestVersion;
  String? get currentVersion => _currentVersion;

  Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    _currentVersion = packageInfo.version;
    await _fetchLatestVersion();
    notifyListeners();
  }

  Future<void> _fetchLatestVersion() async {
    try {
      final response = await http.get(Uri.parse(
          'https://gist.githubusercontent.com/jules-agent/590d916f76f384833722b37803698782/raw/version.json'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        _latestVersion = json['latest_version'];
      }
    } catch (_) {
      // Could not fetch latest version
    }
  }

  bool get isUpdateAvailable {
    if (_latestVersion == null || _currentVersion == null) {
      return false;
    }
    return _latestVersion != _currentVersion;
  }
}
