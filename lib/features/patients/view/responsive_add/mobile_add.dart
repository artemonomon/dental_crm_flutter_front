import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MobileAddPatientsForm extends StatefulWidget {
  const MobileAddPatientsForm({super.key});

  @override
  State<MobileAddPatientsForm> createState() => _MobileAddPatientsFormState();
}

class _MobileAddPatientsFormState extends State<MobileAddPatientsForm> {
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
