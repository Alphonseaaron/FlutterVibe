import 'package:flutter/widgets.dart';

class FocusManagerService {
  static void requestNextFocus(BuildContext context) {
    FocusScope.of(context).nextFocus();
  }

  static void unFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
