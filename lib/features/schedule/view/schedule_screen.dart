import 'package:dental_crm_flutter_front/features/schedule/view/responsive_schedule/responsive_shedule.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold: MobileSchedule(),
      desktopScaffold: DesktopSchedule(),
      tabletScaffold: TabletSchedule(),
    );
  }
}
