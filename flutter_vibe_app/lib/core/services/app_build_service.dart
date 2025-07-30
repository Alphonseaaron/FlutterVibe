import 'dart:convert';
import 'package:http/http.dart' as http;

class AppBuildService {
  Future<Map<String, String>> buildApp(String code) async {
    final response = await http.post(
      Uri.parse('YOUR_BUILD_SERVER_URL_HERE'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'code': code}),
    );
    if (response.statusCode == 200) {
      return Map<String, String>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to build app');
    }
  }
}
