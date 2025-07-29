import 'package:flutter_vibe_app/core/services/api_service.dart';
import 'package:flutter_vibe_app/core/services/cache_service.dart';
import 'package:flutter_vibe_app/core/services/connectivity_service.dart';
import 'package:flutter_vibe_app/core/services/parser.dart';
import 'package:flutter_vibe_app/data/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UserRepository {
  final ApiService _apiService;
  final CacheService _cacheService;
  final ConnectivityService _connectivityService;

  UserRepository(
      this._apiService, this._cacheService, this._connectivityService);

  Future<UserModel> getUser(String id) async {
    final cacheKey = 'user_$id';
    final cachedUser = _cacheService.get<Map<String, dynamic>>(cacheKey);

    if (cachedUser != null) {
      return UserModel.fromJson(cachedUser);
    }

    if (await _connectivityService.isConnected) {
      // final response = await _apiService.get('users/$id');
      // final parsedJson = await parseJson(response.body);
      // _cacheService.set(cacheKey, parsedJson, expiry: const Duration(hours: 1));
      // return UserModel.fromJson(parsedJson);
      throw UnimplementedError();
    } else {
      throw Exception('No internet connection and no cached data');
    }
  }
}
