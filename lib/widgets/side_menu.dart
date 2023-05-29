import 'package:dental_crm_flutter_front/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Transform.scale(
                scale: 0.7, child: Image.asset("assets/images/logo.png")),
          ),
          DrawerListTile(
            title: 'Пацієнти',
            svgSrc: "assets/icons/patients_icon.svg",
            onTap: () {
              Navigator.of(context).pushNamed('/patients');
            },
          ),
          DrawerListTile(
            title: 'Розклад',
            svgSrc: "assets/icons/calendar_icon.svg",
            onTap: () {
              Navigator.of(context).pushNamed('/schedule');
            },
          ),
          DrawerListTile(
            title: 'Профіль',
            svgSrc: "assets/icons/settings_icon.svg",
            onTap: () {
              Navigator.of(context).pushNamed('/profile');
            },
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
    );
  }
}
