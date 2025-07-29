import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/auth_service.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context) {
    Provider.of<AuthService>(context, listen: false)
        .login(emailController.text);
  }

  Future<void> saveDraft() async {
    final box = await Hive.openBox('drafts');
    await box.put('login_email', emailController.text);
    await box.put('login_password', passwordController.text);
  }
}
