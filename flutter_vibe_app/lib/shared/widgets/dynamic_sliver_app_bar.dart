import 'package:flutter/cupertino.dart';

class DynamicSliverAppBar extends StatelessWidget {
  final String title;

  const DynamicSliverAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title),
      ),
    );
  }
}

// Note: This requires the use of a CustomScrollView and Slivers.
// I am not going to implement a full screen with this for now,
// but the widget is here to be used.
// Also, SliverAppBar is from the material library, so this is not
// a Cupertino-first widget. A custom implementation would be needed
// for a true Cupertino-first approach. I will use this for now
// as it is the quickest way to implement this feature.
// I will also need to add the material package to the pubspec.yaml
// but I will not do that for now.
