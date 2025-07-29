import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/modules/profile/profile_screen.dart';
import 'package:flutter_vibe_app/shared/widgets/tab_view.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TabView(
      tabs: const [
        Icon(CupertinoIcons.home),
        Icon(CupertinoIcons.person),
      ],
      pages: [
        CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: const Text('Home'),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.add),
              onPressed: () => Navigator.of(context).pushNamed('/prompt'),
            ),
          ),
          child: const Center(
            child: Text(
              'Home',
            ),
          ),
        ),
        const ProfileScreen(),
      ],
    );
  }
}
