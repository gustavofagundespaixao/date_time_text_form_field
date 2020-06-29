library date_time_text_form_field;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextFormField extends StatefulWidget {
  final InputDecoration decoration;
  final DateTime firstDate;
  final DateFormat format;
  final String labelText;
  final DateTime lastDate;
  final DateTime value;
  final Function(DateTime value) onChanged;
  final Function(String) validator;

  const DateTextFormField(
      {Key key,
      this.decoration,
      this.firstDate,
      this.format,
      @required this.labelText,
      this.lastDate,
      @required this.value,
      @required this.onChanged,
      this.validator})
      : super(key: key);

  @override
  _DateTextFormFieldState createState() => _DateTextFormFieldState();
}

class _DateTextFormFieldState extends State<DateTextFormField> {
  TextEditingController _controller = TextEditingController();
  InputDecoration _decoration;
  DateTime _firstDate;
  DateFormat _format;
  DateTime _lastDate;
  DateTime _value;

  @override
  void initState() {
    _decoration = widget.decoration ??
        InputDecoration(
          labelText: widget.labelText,
        );
    _firstDate = widget.firstDate ?? DateTime(0);
    _format = widget.format ?? DateFormat('dd/MM/yyyy');
    _lastDate = widget.lastDate ?? DateTime(2100);
    _value = widget.value ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = _format.format(_value);

    return TextFormField(
      controller: _controller,
      decoration: _decoration,
      readOnly: true,
      onTap: () async {
        var result = await showDatePicker(
          context: context,
          initialDate: _value,
          firstDate: _firstDate,
          lastDate: _lastDate,
        );

        if (result != null) {
          setState(() => _value = result);
          widget.onChanged(result);
        }
      },
      validator: widget.validator,
    );
  }
}

class TimeTextFormField extends StatefulWidget {
  final InputDecoration decoration;
  final String labelText;
  final TimeOfDay value;
  final Function(TimeOfDay value) onChanged;
  final Function(String) validator;

  const TimeTextFormField(
      {Key key,
      this.decoration,
      @required this.labelText,
      @required this.value,
      @required this.onChanged,
      this.validator})
      : super(key: key);

  @override
  _TimeTextFormFieldState createState() => _TimeTextFormFieldState();
}

class _TimeTextFormFieldState extends State<TimeTextFormField> {
  TextEditingController _controller = TextEditingController();
  InputDecoration _decoration;
  TimeOfDay _value;

  @override
  void initState() {
    _decoration = widget.decoration ??
        InputDecoration(
          labelText: widget.labelText,
        );
    _value = widget.value ?? TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sHour = _value.hour.toString().padLeft(2, '0');
    final sMinute = _value.minute.toString().padLeft(2, '0');

    _controller.text = '$sHour:$sMinute';

    return TextFormField(
      controller: _controller,
      decoration: _decoration,
      readOnly: true,
      onTap: () async {
        var result = await showTimePicker(
          context: context,
          initialTime: _value,
        );

        if (result != null) {
          setState(() => _value = result);
          widget.onChanged(result);
        }
      },
      validator: widget.validator,
    );
  }
}
