import 'package:flutter/cupertino.dart';

class CupertinoCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CupertinoCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(
            color: CupertinoColors.systemGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: value
            ? const Icon(
                CupertinoIcons.check_mark,
                size: 18,
                color: CupertinoColors.activeBlue,
              )
            : null,
      ),
    );
  }
}
