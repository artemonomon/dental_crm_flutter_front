import 'package:dental_crm_flutter_front/features/user_profile/view/responsive_profile/responsive_profile.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold: MobileProfile(),
      tabletScaffold: TabletProfile(),
      desktopScaffold: DesktopProfile(),
    );
  }
}
