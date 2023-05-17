part of 'package:dental_crm_flutter_front/features/auth/bloc/auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final dynamic response;

  AuthSuccess(this.response);
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}
