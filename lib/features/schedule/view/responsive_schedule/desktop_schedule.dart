import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DesktopSchedule extends StatefulWidget {
  const DesktopSchedule({super.key});

  @override
  State<DesktopSchedule> createState() => _DesktopScheduleState();
}

class _DesktopScheduleState extends State<DesktopSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
