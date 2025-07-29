import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'api_error_handler.dart';

class ApiHelper {
  static Future<http.Response> get(BuildContext context, String url,
      {int retries = 3}) async {
    for (int i = 0; i < retries; i++) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          return response;
        } else if (response.statusCode == 401) {
          Provider.of<AuthService>(context, listen: false).logout();
          throw Exception('Unauthorized');
        } else {
          handleApiError(context, response);
          throw Exception('Failed to fetch data from $url');
        }
      } catch (e) {
        if (i == retries - 1) {
          rethrow;
        }
        await Future.delayed(Duration(seconds: 2 * (i + 1)));
      }
    }
    throw Exception('Failed to fetch data from $url');
  }
}
