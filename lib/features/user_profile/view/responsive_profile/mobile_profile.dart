import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MobileProfile extends StatefulWidget {
  const MobileProfile({super.key});

  @override
  State<MobileProfile> createState() => _MobileProfileState();
}

class _MobileProfileState extends State<MobileProfile> {
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
