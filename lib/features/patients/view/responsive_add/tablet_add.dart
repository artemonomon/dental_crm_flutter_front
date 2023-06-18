import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TabletAddPatientsForm extends StatefulWidget {
  const TabletAddPatientsForm({super.key});

  @override
  State<TabletAddPatientsForm> createState() => _TabletAddPatientsFormState();
}

class _TabletAddPatientsFormState extends State<TabletAddPatientsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Пацієнти'),
      ),
      drawer: const SideMenu(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Сторінка додавання пацієнтів'),
          ),
        ],
      ),
    );
  }
}
