import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/modules/profile/profile_screen.dart';
import 'package:flutter_vibe_app/shared/widgets/tab_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
          navigationBar: const CupertinoNavigationBar(
            middle: Text('Home'),
          ),
          child: WebView(
            initialUrl: 'about:blank',
            onWebViewCreated: (controller) {
              controller.loadUrl('http://localhost:8080');
            },
          ),
        ),
        const ProfileScreen(),
      ],
    );
  }
}
