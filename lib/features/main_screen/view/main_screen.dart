import 'package:dental_crm_flutter_front/features/main_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
            child: SideMenu(height: height),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      )),
    );
  }
}
