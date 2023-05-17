import 'package:dental_crm_flutter_front/features/auth/auth.dart';
import 'package:dental_crm_flutter_front/features/auth/view/register_screen.dart';
import 'package:dental_crm_flutter_front/features/main_screen/view/main_screen.dart';

final routes = {
  '/': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/main': (context) => const MainScreen(),
};
