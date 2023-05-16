import 'package:flutter/material.dart';
import 'router/router.dart';

class DentalCrmApp extends StatelessWidget {
  const DentalCrmApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dental CRM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}
