import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/shared/utils/extensions.dart';

class DebouncedCupertinoSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final Duration debounceDuration;

  const DebouncedCupertinoSearchBar({
    super.key,
    required this.onChanged,
    this.debounceDuration = const Duration(milliseconds: 500),
  });

  @override
  State<DebouncedCupertinoSearchBar> createState() =>
      _DebouncedCupertinoSearchBarState();
}

class _DebouncedCupertinoSearchBarState
    extends State<DebouncedCupertinoSearchBar> {
  final _textController = TextEditingController();
  late final Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer(milliseconds: widget.debounceDuration.inMilliseconds);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: _textController,
      onChanged: (value) {
        _debouncer.run(() {
          widget.onChanged(value);
        });
      },
    );
  }
}
