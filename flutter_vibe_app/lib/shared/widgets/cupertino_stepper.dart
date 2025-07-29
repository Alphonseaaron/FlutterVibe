import 'package:flutter/cupertino.dart';

class CupertinoStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const CupertinoStepper({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentStep
                ? CupertinoColors.activeBlue
                : CupertinoColors.systemGrey,
          ),
        );
      }),
    );
  }
}
