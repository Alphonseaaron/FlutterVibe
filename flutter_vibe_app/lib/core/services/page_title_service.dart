import 'package:flutter/cupertino.dart';

class PageTitleService extends ChangeNotifier {
  String _title = '';

  String get title => _title;

  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }
}
