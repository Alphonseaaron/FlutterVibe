import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/connectivity_service.dart';
import 'package:provider/provider.dart';

class OfflineIndicator extends StatelessWidget {
  final Widget child;

  const OfflineIndicator({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Consumer<ConnectivityService>(
          builder: (context, connectivityService, _) {
            if (connectivityService.connectionStatus ==
                ConnectionStatus.offline) {
              return const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CupertinoPopupSurface(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'No internet connection',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            } else if (connectivityService.connectionStatus ==
                ConnectionStatus.slow) {
              return const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CupertinoPopupSurface(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Slow connection',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
