import 'package:flutter/cupertino.dart';

class CupertinoSwitchListTile extends StatelessWidget {
  final Widget title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CupertinoSwitchListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: title,
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final Widget title;
  final Widget? trailing;

  const CupertinoListTile({
    super.key,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title,
        if (trailing != null) trailing!,
      ],
    );
  }
}
