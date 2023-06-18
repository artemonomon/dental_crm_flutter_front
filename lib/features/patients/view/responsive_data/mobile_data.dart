import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MobileDataScreen extends StatefulWidget {
  const MobileDataScreen({super.key});

  @override
  State<MobileDataScreen> createState() => _MobileDataScreenState();
}

class _MobileDataScreenState extends State<MobileDataScreen> {
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
