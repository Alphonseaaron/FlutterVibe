import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'api_helper.dart';

class ApiService {
  final http.Client _client;

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  Future<http.Response> get(BuildContext context, String url) async {
    return ApiHelper.get(context, url);
  }
}
