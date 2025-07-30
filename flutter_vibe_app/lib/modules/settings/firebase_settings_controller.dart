import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseSettingsController extends ChangeNotifier {
  final apiKeyController = TextEditingController();
  final appIdController = TextEditingController();
  final messagingSenderIdController = TextEditingController();
  final projectIdController = TextEditingController();
  final authDomainController = TextEditingController();
  final storageBucketController = TextEditingController();
  final iosBundleIdController = TextEditingController();

  FirebaseSettingsController() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    apiKeyController.text = prefs.getString('firebase_api_key') ?? '';
    appIdController.text = prefs.getString('firebase_app_id') ?? '';
    messagingSenderIdController.text =
        prefs.getString('firebase_messaging_sender_id') ?? '';
    projectIdController.text = prefs.getString('firebase_project_id') ?? '';
    authDomainController.text = prefs.getString('firebase_auth_domain') ?? '';
    storageBucketController.text =
        prefs.getString('firebase_storage_bucket') ?? '';
    iosBundleIdController.text = prefs.getString('firebase_ios_bundle_id') ?? '';
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firebase_api_key', apiKeyController.text);
    await prefs.setString('firebase_app_id', appIdController.text);
    await prefs.setString(
        'firebase_messaging_sender_id', messagingSenderIdController.text);
    await prefs.setString('firebase_project_id', projectIdController.text);
    await prefs.setString('firebase_auth_domain', authDomainController.text);
    await prefs.setString(
        'firebase_storage_bucket', storageBucketController.text);
    await prefs.setString('firebase_ios_bundle_id', iosBundleIdController.text);
  }
}
