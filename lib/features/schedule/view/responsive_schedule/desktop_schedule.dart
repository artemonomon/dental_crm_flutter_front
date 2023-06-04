import 'package:calendar_view/calendar_view.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DesktopSchedule extends StatefulWidget {
  const DesktopSchedule({super.key});

  @override
  State<DesktopSchedule> createState() => _DesktopScheduleState();
}

class _DesktopScheduleState extends State<DesktopSchedule> {
  final _controller = EventController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: DayView(
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
          )
        ],
      ),
    );
  }
}
