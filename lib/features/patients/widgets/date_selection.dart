import 'package:flutter/material.dart';

class DateSelection extends StatefulWidget {
  final void Function(DateTime) onDateSelected; // Step 1

  const DateSelection({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  int _day = 1;
  int _month = 1;
  int _year = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Дата народження:'),
        const SizedBox(width: 10),
        DropdownButton<int>(
          value: _day,
          items: List.generate(31, (index) => index + 1)
              .map((day) => DropdownMenuItem(
                    value: day,
                    child: Text(day.toString()),
                  ))
              .toList(),
          onChanged: (int? value) {
            setState(() {
              _day = value!;
              _notifyDateSelected(); // Step 3
            });
          },
        ),
        const SizedBox(width: 10),
        DropdownButton<int>(
          value: _month,
          items: List.generate(12, (index) => index + 1)
              .map((month) => DropdownMenuItem(
                    value: month,
                    child: Text(month.toString()),
                  ))
              .toList(),
          onChanged: (int? value) {
            setState(() {
              _month = value!;
              _notifyDateSelected(); // Step 3
            });
          },
        ),
        const SizedBox(width: 10),
        DropdownButton<int>(
          value: _year,
          items: List.generate(121, (index) => DateTime.now().year - index)
              .map((year) => DropdownMenuItem(
                    value: year,
                    child: Text(year.toString()),
                  ))
              .toList(),
          onChanged: (int? value) {
            setState(() {
              _year = value!;
              _notifyDateSelected(); // Step 3
            });
          },
        ),
      ],
    );
  }

  void _notifyDateSelected() {
    final selectedDate = DateTime(_year, _month, _day);
    widget.onDateSelected(selectedDate); // Step 2
  }
}
