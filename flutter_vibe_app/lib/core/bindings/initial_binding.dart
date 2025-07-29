import 'package:get/get.dart';
import 'package:flutter_vibe_app/core/services/cache_service.dart';
import 'package:flutter_vibe_app/core/services/connectivity_service.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<StorageService>(() => StorageService());
    Get.lazyPut<ConnectivityService>(() => ConnectivityService());
    Get.lazyPut<CacheService>(() => CacheService());
  }
}
