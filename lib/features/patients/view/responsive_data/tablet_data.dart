import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TabletDataScreen extends StatefulWidget {
  const TabletDataScreen({super.key});

  @override
  State<TabletDataScreen> createState() => _TabletDataScreenState();
}

class _TabletDataScreenState extends State<TabletDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Інформація про пацієнта'),
      ),
      drawer: const SideMenu(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Сторінка інформації про пацієнта'),
          ),
        ],
      ),
    );
  }
}
