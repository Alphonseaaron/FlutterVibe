import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/settings/android_settings.dart';
import 'package:background_locator_2/settings/ios_settings.dart';
import 'package:background_locator_2/settings/locator_settings.dart';

@pragma('vm:entry-point')
void callback(LocationDto locationDto) async {
  // Handle location updates
}

class LocationService {
  static Future<void> init() async {
    await BackgroundLocator.initialize();
  }

  static Future<void> start() async {
    await BackgroundLocator.registerLocationUpdate(
      callback,
      settings: const LocatorSettings(
        android: AndroidSettings(
          accuracy: LocationAccuracy.HIGH,
          interval: 5,
          distanceFilter: 0,
          client: LocationClient.google,
        ),
        ios: IOSSettings(
          accuracy: LocationAccuracy.HIGH,
          distanceFilter: 0,
        ),
      ),
    );
  }
}
