import 'package:flutter/cupertino.dart';

Future<DateTime?> showCupertinoDateTimePicker(
  BuildContext context, {
  DateTime? initialDate,
  DateTime? minimumDate,
  DateTime? maximumDate,
}) {
  return showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (context) {
      DateTime? selectedDate = initialDate;
      return Container(
        height: 216,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: initialDate,
                minimumDate: minimumDate,
                maximumDate: maximumDate,
                onDateTimeChanged: (DateTime newDateTime) {
                  selectedDate = newDateTime;
                },
              ),
            ),
            CupertinoButton(
              child: const Text('Done'),
              onPressed: () => Navigator.of(context).pop(selectedDate),
            ),
          ],
        ),
      );
    },
  );
}
