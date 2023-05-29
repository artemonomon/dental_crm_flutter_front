import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TabletSchedule extends StatefulWidget {
  const TabletSchedule({super.key});

  @override
  State<TabletSchedule> createState() => _TabletScheduleState();
}

class _TabletScheduleState extends State<TabletSchedule> {
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
            child: Text('Сторінка з розкладом'),
          ),
        ],
      ),
    );
  }
}
