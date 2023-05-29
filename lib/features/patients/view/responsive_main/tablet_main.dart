import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TabletMain extends StatefulWidget {
  const TabletMain({super.key});

  @override
  State<TabletMain> createState() => _TabletMainState();
}

class _TabletMainState extends State<TabletMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Пацієнти'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text('Сторінка зі списком пацієнтів'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/patients/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
