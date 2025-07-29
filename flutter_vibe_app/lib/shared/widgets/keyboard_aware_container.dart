import 'package:flutter/widgets.dart';

class KeyboardAwareContainer extends StatelessWidget {
  final Widget child;

  const KeyboardAwareContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: child,
      ),
    );
  }
}
