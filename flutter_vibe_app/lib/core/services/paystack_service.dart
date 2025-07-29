import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class PaystackService {
  final PaystackPlugin _paystack = PaystackPlugin();

  Future<void> makePayment(BuildContext context) async {
    await _paystack.initialize(publicKey: 'YOUR_PAYSTACK_PUBLIC_KEY');
    final Charge charge = Charge()
      ..amount = 1000
      ..reference = 'unique_transaction_ref'
      ..email = 'test@test.com';
    final CheckoutResponse response = await _paystack.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );
    if (response.status) {
      // Payment successful
    } else {
      // Payment failed
    }
  }
}
