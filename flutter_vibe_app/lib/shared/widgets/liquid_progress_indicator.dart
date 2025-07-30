import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class LiquidProgressIndicatorWidget extends StatelessWidget {
  final double value;

  const LiquidProgressIndicatorWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LiquidCircularProgressIndicator(
      value: value,
      valueColor: const AlwaysStoppedAnimation(Colors.blue),
      backgroundColor: Colors.white,
      borderColor: Colors.blue,
      borderWidth: 5.0,
      direction: Axis.vertical,
      center: Text("$value%"),
    );
  }
}
