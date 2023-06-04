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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Профіль'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: DayView(
        controller: _controller,
        eventTileBuilder: (date, events, boundry, start, end) {
          // Return your widget to display as event tile.
          return Container();
        },
        onEventTap: (events, date) {
          // Implement callback when user taps on an event.
          print(events);
        },
      ),
    );
  }
}
