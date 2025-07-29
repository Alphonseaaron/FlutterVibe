import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileController(),
      child: Consumer<ProfileController>(
        builder: (context, controller, child) {
          return const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Profile'),
            ),
            child: Center(
              child: Text('Profile Screen'),
            ),
          );
        },
      ),
    );
  }
}
