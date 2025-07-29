import 'package:flutter/cupertino.dart';

class PromoCodeService extends ChangeNotifier {
  String? _promoCode;
  double _discount = 0;

  String? get promoCode => _promoCode;
  double get discount => _discount;

  Future<void> applyPromoCode(String code) async {
    // This should be done on your server.
    // For this example, I am just setting a dummy discount.
    if (code == 'DISCOUNT10') {
      _promoCode = code;
      _discount = 0.1;
    } else {
      _promoCode = null;
      _discount = 0;
    }
    notifyListeners();
  }
}
