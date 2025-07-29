import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';

class FlutterwaveService {
  Future<void> makePayment(BuildContext context) async {
    final Customer customer = Customer(
      name: "Flutter Vibe",
      phoneNumber: "1234567890",
      email: "test@test.com",
    );

    final Flutterwave flutterwave = Flutterwave(
      context: context,
      publicKey: "YOUR_FLUTTERWAVE_PUBLIC_KEY",
      currency: "USD",
      redirectUrl: 'https://fluttervibe.com',
      txRef: "unique_transaction_ref",
      amount: "10",
      customer: customer,
      paymentOptions: "card, mobilemoney, ussd",
      customization: Customization(title: "Test Payment"),
      isTestMode: true,
    );

    final ChargeResponse response = await flutterwave.charge();
    if (response.success!) {
      // Payment successful
    } else {
      // Payment failed
    }
  }
}
