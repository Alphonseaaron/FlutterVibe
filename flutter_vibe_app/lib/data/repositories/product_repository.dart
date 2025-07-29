import 'package:flutter_vibe_app/core/services/api_service.dart';
import 'package:flutter_vibe_app/core/services/cache_service.dart';
import 'package:flutter_vibe_app/core/services/connectivity_service.dart';
import 'package:flutter_vibe_app/core/services/parser.dart';
import 'package:flutter_vibe_app/data/models/product_model.dart';

class ProductRepository {
  final ApiService _apiService;
  final CacheService _cacheService;
  final ConnectivityService _connectivityService;

  ProductRepository(
      this._apiService, this._cacheService, this._connectivityService);

  Future<List<ProductModel>> getProducts() async {
    const cacheKey = 'products';
    final cachedProducts = _cacheService.get<List<dynamic>>(cacheKey);

    if (cachedProducts != null) {
      return cachedProducts
          .map((json) => ProductModel.fromJson(json))
          .toList();
    }

    if (await _connectivityService.isConnected) {
      // final response = await _apiService.get('products');
      // final parsedJson = await parseJson(response.body);
      // _cacheService.set(cacheKey, parsedJson, expiry: const Duration(minutes: 30));
      // return (parsedJson as List).map((json) => ProductModel.fromJson(json)).toList();
      throw UnimplementedError();
    } else {
      throw Exception('No internet connection and no cached data');
    }
  }
}
