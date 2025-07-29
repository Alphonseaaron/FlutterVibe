import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/loading_service.dart';
import 'package:provider/provider.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;

  const LoadingOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Consumer<LoadingService>(
          builder: (context, loadingService, _) {
            if (loadingService.isLoading) {
              return Container(
                color: CupertinoColors.black.withOpacity(0.5),
                child: const Center(
                  child: CupertinoActivityIndicator(
                    radius: 20,
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
