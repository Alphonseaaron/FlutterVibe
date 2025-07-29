import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/shared/widgets/app_button.dart';
import 'package:flutter_vibe_app/shared/widgets/app_text_field.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController();
    _loadDraft();
  }

  Future<void> _loadDraft() async {
    final box = await Hive.openBox('drafts');
    final email = box.get('login_email');
    final password = box.get('login_password');
    if (email != null) {
      _controller.emailController.text = email;
    }
    if (password != null) {
      _controller.passwordController.text = password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _controller,
      child: Consumer<LoginController>(
        builder: (context, controller, child) {
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Login'),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                    placeholder: 'Email',
                    controller: controller.emailController,
                    onChanged: (value) => controller.saveDraft(),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    placeholder: 'Password',
                    obscureText: true,
                    controller: controller.passwordController,
                    onChanged: (value) => controller.saveDraft(),
                  ),
                  const SizedBox(height: 32),
                  AppButton(
                    text: 'Login',
                    onPressed: () => controller.login(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
