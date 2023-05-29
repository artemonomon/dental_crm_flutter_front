import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MobileSchedule extends StatefulWidget {
  const MobileSchedule({super.key});

  @override
  State<MobileSchedule> createState() => _MobileScheduleState();
}

class _MobileScheduleState extends State<MobileSchedule> {
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
