import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  Future<void> write(String key, String value);
  Future<String?> read(String key);
  Future<void> delete(String key);
}

class SharedPreferencesStorage extends Storage {
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    await _checkVersion();
  }

  Future<void> _checkVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    final storedVersion = _prefs.getString('version');

    if (storedVersion != currentVersion) {
      // Clear old data
      await _prefs.clear();
      await _prefs.setString('version', currentVersion);
    }
  }

  @override
  Future<void> write(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  Future<String?> read(String key) async {
    return _prefs.getString(key);
  }

  @override
  Future<void> delete(String key) async {
    await _prefs.remove(key);
  }
}

class StorageService {
  final Storage _storage;

  StorageService(this._storage);

  Future<void> write(String key, String value) async {
    await _storage.write(key, value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key);
  }
}
