import 'package:dental_crm_flutter_front/features/main_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.2),
            DrawerHeader(
              child: Transform.scale(
                  scale: 0.7, child: Image.asset("assets/images/logo.png")),
            ),
            DrawerListTile(
              title: 'Пацієнти',
              svgSrc: "assets/icons/patients_icon.svg",
              onTap: () {},
            ),
            DrawerListTile(
              title: 'Розклад',
              svgSrc: "assets/icons/calendar_icon.svg",
              onTap: () {},
            ),
            DrawerListTile(
              title: 'Налаштування',
              svgSrc: "assets/icons/settings_icon.svg",
              onTap: () {},
            ),
            DrawerListTile(
              title: 'Вийти',
              svgSrc: "assets/icons/logout_icon.svg",
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
