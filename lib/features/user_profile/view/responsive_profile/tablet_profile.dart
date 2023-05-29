import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TabletProfile extends StatefulWidget {
  const TabletProfile({super.key});

  @override
  State<TabletProfile> createState() => _TabletProfileState();
}

class _TabletProfileState extends State<TabletProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Профіль'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text('Сторінка з профілем'),
          ),
        ],
      ),
    );
  }
}
