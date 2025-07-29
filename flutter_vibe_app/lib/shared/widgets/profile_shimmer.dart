import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/shared/widgets/shimmer_loader.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const ShimmerLoader.circular(width: 100, height: 100),
          const SizedBox(height: 16),
          ShimmerLoader.rectangular(height: 20, width: 200),
          const SizedBox(height: 8),
          ShimmerLoader.rectangular(height: 20, width: 150),
        ],
      ),
    );
  }
}
