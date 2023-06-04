import 'package:flutter/material.dart';

class DateSelection extends StatefulWidget {
  const DateSelection({super.key});

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
          onChanged: (int? value) => setState(() => _day = value!),
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
          onChanged: (int? value) => setState(() => _month = value!),
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
          onChanged: (int? value) => setState(() => _year = value!),
        ),
      ],
    );
  }
}
