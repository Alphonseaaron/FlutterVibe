import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkService {
  final FirebaseDynamicLinks _dynamicLinks = FirebaseDynamicLinks.instance;

  Future<void> init() async {
    _dynamicLinks.onLink.listen((PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;
      if (deepLink != null) {
        // Handle deep link
      }
    });

    final PendingDynamicLinkData? data =
        await _dynamicLinks.getInitialLink();
    final Uri? deepLink = data?.link;
    if (deepLink != null) {
      // Handle deep link
    }
  }
}
