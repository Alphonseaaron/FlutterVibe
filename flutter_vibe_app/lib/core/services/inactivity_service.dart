import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_vibe_app/core/services/auth_service.dart';
import 'package:provider/provider.dart';

class InactivityService extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const InactivityService({
    super.key,
    required this.child,
    this.duration = const Duration(minutes: 5),
  });

  @override
  State<InactivityService> createState() => _InactivityServiceState();
}

class _InactivityServiceState extends State<InactivityService> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(widget.duration, () {
      Provider.of<AuthService>(context, listen: false).logout();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startTimer,
      onPanDown: (_) => _startTimer(),
      onScaleStart: (_) => _startTimer(),
      child: widget.child,
    );
  }
}
