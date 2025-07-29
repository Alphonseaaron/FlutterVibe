import 'package:flutter/cupertino.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;

  const ErrorScreen({super.key, this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.exclamationmark_circle,
              size: 50,
              color: CupertinoColors.destructiveRed,
            ),
            const SizedBox(height: 16),
            Text(message ?? 'An error occurred'),
            const SizedBox(height: 16),
            CupertinoButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
