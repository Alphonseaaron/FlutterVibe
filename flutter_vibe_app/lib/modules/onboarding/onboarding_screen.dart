import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/modules/home/home_screen.dart';
import 'package:flutter_vibe_app/shared/widgets/lottie_animation.dart';
import 'package:provider/provider.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingController(),
      child: Consumer<OnboardingController>(
        builder: (context, controller, child) {
          return CupertinoPageScaffold(
            child: PageView(
              controller: controller.pageController,
              children: [
                _buildPage(
                  title: 'Welcome to FlutterVibe',
                  subtitle: 'The best way to build your app.',
                  animation: 'assets/animations/welcome.json',
                ),
                _buildPage(
                  title: 'Create your app',
                  subtitle:
                      'Just describe your app and we will build it for you.',
                ),
                _buildPage(
                  title: 'Get started',
                  subtitle: 'Let\'s get started!',
                  child: CupertinoButton(
                    child: const Text('Get Started'),
                    onPressed: () {
                      controller.completeOnboarding();
                      Navigator.of(context).pushReplacement(
                        CupertinoPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String subtitle,
    String? animation,
    Widget? child,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (animation != null)
            LottieAnimation(
              asset: animation,
              width: 200,
              height: 200,
            ),
          const SizedBox(height: 32),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          if (child != null) ...[
            const SizedBox(height: 32),
            child,
          ],
        ],
      ),
    );
  }
}
