import 'package:dental_crm_flutter_front/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          scaffoldBackgroundColor: AppColors.mainBlueColor,
          textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          canvasColor: AppColors.mainBlueColor),
      routes: routes,
    );
  }
}
