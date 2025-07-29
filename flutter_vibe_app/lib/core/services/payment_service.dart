import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentService {
  Future<void> makePayment(BuildContext context) async {
    try {
      // 1. create payment intent on the server
      final response = await _createPaymentIntent();
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          merchantDisplayName: 'Flutter Vibe',
          paymentIntentClientSecret: response['client_secret'],
          // Customer params
          customerId: response['customer'],
          customerEphemeralKeySecret: response['ephemeralKey'],
        ),
      );
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          action: SnackBarAction(
            label: 'Retry',
            onPressed: () => makePayment(context),
          ),
        ),
      );
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent() async {
    // This should be done on your server.
    // For this example, I am just returning a dummy response.
    return {
      'client_secret': 'sk_test_123',
      'customer': 'cus_123',
      'ephemeralKey': 'ek_test_123',
    };
  }
}
