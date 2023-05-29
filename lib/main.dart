import 'package:dental_crm_flutter_front/dental_crm_app.dart';
import 'package:dental_crm_flutter_front/features/auth/auth_bloc/auth_bloc.dart';
import 'package:dental_crm_flutter_front/repositories/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  final authRepository = AuthRepository();
  runApp(BlocProvider<AuthBloc>(
    create: (context) {
      return AuthBloc(authRepository)..add(AppStared());
    },
    child: const DentalCrmApp(),
  ));
}
