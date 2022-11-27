/*
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class DatetimePicker {
  DateTime? dateTime;
  String? isoStringDateTime;

  String getText() {
    return DateFormat('MM/dd/yyyy HH:mm').format(dateTime!);
  }

  String? getIsoDateTime() {
    return isoStringDateTime;
  }

  Future<String?>? pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return null;

    final time = await pickTime(context);
    if (time == null) return null;

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    return dateTime
        ?.toUtc()
        .toIso8601String(); */
/*
    utcDateTime = dateTime?.toUtc();
    isoStringDateTime = utcDateTime?.toIso8601String();*//*

  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
          : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }
}

class DatetimePickerInput extends StatefulWidget {
  final String? dateTime;
  final String? labelText;
  final ValueChanged<String> onChanged;

  const DatetimePickerInput(
      {super.key, this.dateTime, required this.onChanged, this.labelText});

  @override
  _DatetimePickerInputState createState() =>
      _DatetimePickerInputState(labelText: labelText, preDateTime: dateTime);
}

class _DatetimePickerInputState extends State<DatetimePickerInput> {
  DateTime? dateTime;
  final String? labelText;
  final String? preDateTime;

  _DatetimePickerInputState({
    required this.preDateTime,
    required this.labelText,
  });

  String getText() {
    if (dateTime == null && preDateTime == null) {
      return '';
    } else {
      if (dateTime != null) {
        return DateFormat('MM/dd/yyyy HH:mm').format(dateTime!);
      } else if (preDateTime != null) {
        return DateFormat('MM/dd/yyyy HH:mm')
            .format(DateTime.parse(preDateTime!));
      } else {
        return '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller = TextEditingController(text: getText());
    return AppTextField(
      controller: controller,
      textFieldType: TextFieldType.OTHER,
      decoration: InputDecoration(
        labelText: labelText ?? 'Date Time Picker',
      ),
      readOnly: true,
      onTap: () async {
        await pickDateTime(context);
        setState(() {
          controller = TextEditingController(text: preDateTime ?? getText());
        });
        widget.onChanged(getText());
      },
    );
  }

  Future<void> pickDateTime(BuildContext context) async {
    final date = await pickDate(
      context: context,
    );
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime?> pickDate(
      {required BuildContext context, DateTime? firstDate,}) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
          : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }
}

class DatePickerInput extends HookWidget {
  final String? labelText;
  final String? preDateTime;
  final Function(String value)? onChanged;

  const DatePickerInput({
    required this.preDateTime,
    required this.labelText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<DateTime> dateTime =
        useState(DateTime.parse(preDateTime!));
    final controller = useTextEditingController(
      text: DateFormat('MM/dd/yyyy').format(dateTime.value),
    );
    return AppTextField(
      controller: controller,
      textFieldType: TextFieldType.OTHER,
      decoration: InputDecoration(
        labelText: labelText ?? 'Date Time Picker',
      ),
      readOnly: true,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: dateTime.value,
          firstDate: DateTime(DateTime.now().year - 5),
          lastDate: DateTime.now(),
        );
        if (date == null) return;
        dateTime.value = date;
        controller.text = DateFormat('MM/dd/yyyy').format(dateTime.value);
        onChanged!(dateTime.value.toLocal().toIso8601String());
      },
    );
  }
}
*/
