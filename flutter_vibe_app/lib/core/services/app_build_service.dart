import 'dart:convert';
import 'package:http/http.dart' as http;

class AppBuildService {
  Future<String> buildApp(String code) async {
    final response = await http.post(
      Uri.parse('YOUR_BUILD_SERVER_URL_HERE'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'code': code}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['url'];
    } else {
      throw Exception('Failed to build app');
    }
  }
}
