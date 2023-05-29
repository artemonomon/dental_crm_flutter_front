import 'package:dental_crm_flutter_front/features/patients/view/responsive_main/responsive.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold: MobileMain(),
      tabletScaffold: TabletMain(),
      desktopScaffold: DesktopMain(),
    );
  }
}
