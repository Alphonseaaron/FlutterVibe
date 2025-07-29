import 'package:flutter/widgets.dart';
import 'package:flutter_vibe_app/core/services/auth_service.dart';
import 'package:flutter_vibe_app/modules/login/login_screen.dart';
import 'package:provider/provider.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, _) {
        if (authService.isAuthenticated) {
          return child;
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
