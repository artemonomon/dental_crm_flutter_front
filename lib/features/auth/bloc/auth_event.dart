part of 'package:dental_crm_flutter_front/features/auth/bloc/auth_bloc.dart';

abstract class AuthEvent {}

class RegistrationEvent extends AuthEvent {
  final RegistrationRequest registrationRequest;

  RegistrationEvent(this.registrationRequest);
}

class LoginEvent extends AuthEvent {
  final LoginRequest loginRequest;

  LoginEvent(this.loginRequest);
}
