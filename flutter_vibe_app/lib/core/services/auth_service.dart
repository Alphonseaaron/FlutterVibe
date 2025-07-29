import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/token_service.dart';

class AuthService extends ChangeNotifier {
  final _tokenService = TokenService();
  final _firebaseAuth = FirebaseAuth.instance;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String email) async {
    var acs = ActionCodeSettings(
      url: 'https://fluttervibe.page.link/finishSignUp?email=$email',
      handleCodeInApp: true,
      iOSBundleId: 'com.example.flutterVibeApp',
      androidPackageName: 'com.example.flutter_vibe_app',
      androidInstallApp: true,
      androidMinimumVersion: '12',
    );
    await _firebaseAuth.sendSignInLinkToEmail(
        email: email, actionCodeSettings: acs);
  }

  Future<void> logout() async {
    await _tokenService.deleteToken();
    await _firebaseAuth.signOut();
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> checkAuth() async {
    final token = await _tokenService.getToken();
    if (token != null) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }
}
