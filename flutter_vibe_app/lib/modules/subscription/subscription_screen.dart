import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/promo_code_service.dart';
import 'package:provider/provider.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Subscription'),
      ),
      child: ListView(
        children: [
          _buildPromoCodeField(),
          _buildPlanTile(
            title: 'Free',
            price: '\$0',
            features: [
              '1 project',
              '1 build per day',
            ],
          ),
          _buildPlanTile(
            title: 'Pro',
            price: '\$10/month',
            features: [
              '10 projects',
              '10 builds per day',
              'Priority support',
            ],
          ),
          _buildPlanTile(
            title: 'Enterprise',
            price: 'Contact us',
            features: [
              'Unlimited projects',
              'Unlimited builds',
              'Dedicated support',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCodeField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<PromoCodeService>(
        builder: (context, promoCodeService, _) {
          return Row(
            children: [
              Expanded(
                child: CupertinoTextField(
                  placeholder: 'Promo Code',
                  onChanged: (value) {
                    promoCodeService.applyPromoCode(value);
                  },
                ),
              ),
              if (promoCodeService.discount > 0)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                      '${(promoCodeService.discount * 100).toStringAsFixed(0)}% off'),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPlanTile({
    required String title,
    required String price,
    required List<String> features,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            price,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          ...features.map((feature) => Text(feature)),
          const SizedBox(height: 16),
          CupertinoButton.filled(
            child: const Text('Choose Plan'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
