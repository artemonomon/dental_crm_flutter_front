import 'package:dental_crm_flutter_front/features/auth/view/view.dart';
import 'package:dental_crm_flutter_front/features/patients/view/view.dart';
import 'package:dental_crm_flutter_front/features/schedule/view/schedule_screen.dart';
import 'package:dental_crm_flutter_front/features/user_profile/view/user_profile_screen.dart';
import 'package:dental_crm_flutter_front/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DentalCrmApp extends StatefulWidget {
  const DentalCrmApp({super.key});

  @override
  State<DentalCrmApp> createState() => _DentalCrmAppState();
}

class _DentalCrmAppState extends State<DentalCrmApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dental CRM',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.mainBlueColor,
          appBarTheme: const AppBarTheme(
            color: AppColors.mainBlueColor,
            elevation: 0,
            centerTitle: true,
          ),
          textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          canvasColor: AppColors.mainBlueColor),
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/patients': (context) => const MainScreen(),
        '/patients/add': (context) => const AddPatientForm(),
        '/profile': (context) => const UserProfileScreen(),
        '/schedule': (context) => const ScheduleScreen(),
      },
    );
  }
}
