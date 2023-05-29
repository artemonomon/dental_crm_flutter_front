import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DesktopProfile extends StatefulWidget {
  const DesktopProfile({super.key});

  @override
  State<DesktopProfile> createState() => _DesktopProfileState();
}

class _DesktopProfileState extends State<DesktopProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: Text('Сторінка з профілем'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
