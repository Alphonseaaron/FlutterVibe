import 'package:flutter/cupertino.dart';

class MotionService extends ChangeNotifier {
  bool _reduceMotion = false;

  bool get reduceMotion => _reduceMotion;

  void setReduceMotion(bool value) {
    _reduceMotion = value;
    notifyListeners();
  }
}
