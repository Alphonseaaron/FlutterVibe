import 'package:flutter_vibe_app/modules/home/home_binding.dart';
import 'package:flutter_vibe_app/modules/home/home_screen.dart';
import 'package:flutter_vibe_app/modules/login/login_binding.dart';
import 'package:flutter_vibe_app/modules/login/login_screen.dart';
import 'package:flutter_vibe_app/modules/profile/profile_binding.dart';
import 'package:flutter_vibe_app/modules/profile/profile_screen.dart';
import 'package:get/get.dart';

import '../core/constants/routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
