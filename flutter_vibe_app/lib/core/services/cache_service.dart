import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

part 'cache_service.g.dart';

@HiveType(typeId: 0)
class CacheEntry extends HiveObject {
  @HiveField(0)
  late dynamic value;

  @HiveField(1)
  late DateTime expiry;
}

class CacheService extends GetxService {
  late final Box<CacheEntry> _box;

  Future<CacheService> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDir.path)
      ..registerAdapter(CacheEntryAdapter());
    _box = await Hive.openBox<CacheEntry>('cache');
    return this;
  }

  T? get<T>(String key) {
    final entry = _box.get(key);
    if (entry == null || entry.expiry.isBefore(DateTime.now())) {
      return null;
    }
    return entry.value as T?;
  }

  void set<T>(String key, T value, {Duration? expiry}) {
    final expiryTime = DateTime.now().add(expiry ?? const Duration(days: 1));
    _box.put(key, CacheEntry()
      ..value = value
      ..expiry = expiryTime);
  }
}
