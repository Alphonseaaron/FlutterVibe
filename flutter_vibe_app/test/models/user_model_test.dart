import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibe_app/data/models/user_model.dart';

void main() {
  test('UserModel can be created from json', () {
    final json = {
      'id': '1',
      'name': 'Test User',
      'email': 'test@test.com',
    };
    final user = UserModel.fromJson(json);
    expect(user.id, '1');
    expect(user.name, 'Test User');
    expect(user.email, 'test@test.com');
  });
}
