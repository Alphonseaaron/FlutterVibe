import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerLoader.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder();

  const ShimmerLoader.circular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CupertinoTheme.of(context).brightness == Brightness.light
          ? CupertinoColors.systemGrey4
          : CupertinoColors.systemGrey,
      highlightColor: CupertinoTheme.of(context).brightness == Brightness.light
          ? CupertinoColors.systemGrey6
          : CupertinoColors.systemGrey2,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: CupertinoColors.systemGrey,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
