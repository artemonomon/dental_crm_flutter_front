import 'package:calendar_view/calendar_view.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MobileSchedule extends StatefulWidget {
  const MobileSchedule({super.key});

  @override
  State<MobileSchedule> createState() => _MobileScheduleState();
}

class _MobileScheduleState extends State<MobileSchedule> {
  final _controller = EventController();
  DateTime? selectedHour;
  String? selectedPatient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Профіль'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: GestureDetector(
        onTap: () {
          if (selectedHour != null) {
            _showPatientSelectionForm();
          }
        },
        child: DayView(
          controller: _controller,
          eventTileBuilder: (date, events, boundary, start, end) {
            // Return your widget to display as an event tile.
            return Container();
          },
          onEventTap: (events, date) {
            setState(() {
              // selectedHour = date;
              // if (events.isNotEmpty) {
              //   // Assuming each event has a patient property
              //   selectedPatient = events[0]
              //       .patient
              //       .toString(); // Access the patient property of the first event
              // } else {
              //   selectedPatient =
              //       null; // No events, clear the selected patient
              // }
            });
          },
        ),
      ),
    );
  }

  void _showPatientSelectionForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a Patient'),
          content: Container(
            // Build your form for selecting a patient here.
            // You can use DropdownButton, ListView, or any other widget as per your design.
            child: Text(
                'Selected Hour: $selectedHour\nSelected Patient: $selectedPatient'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Perform any necessary actions when the user confirms the patient selection.
                Navigator.of(context).pop();
              },
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                // Clear the selected hour and patient if the user cancels the selection.
                setState(() {
                  selectedHour = null;
                  selectedPatient = null;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
