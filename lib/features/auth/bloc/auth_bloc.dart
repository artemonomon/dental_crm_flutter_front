import 'package:dental_crm_flutter_front/repositories/auth/auth_repository.dart';
import 'package:dental_crm_flutter_front/repositories/auth/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {

//   final AuthRepository authRepository;

//   AuthBloc(this.authRepository) : super(AuthInitial());

//   Stream<AuthState> mapEventToState(AuthEvent event) async* {
//     yield AuthLoading();

//     try {
//       if (event is RegistrationEvent) {
//         final response =
//             await authRepository.register(event.registrationRequest);
//         yield AuthSuccess(response);
//       } else if (event is LoginEvent) {
//         final response = await authRepository.login(event.loginRequest);
//         yield AuthSuccess(response);
//       }
//     } catch (error) {
//       yield AuthFailure('Failed to authenticate: $error');
//     }
//   }
//  }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<RegistrationEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final response =
            await authRepository.register(event.registrationRequest);
        emit(AuthSuccess(response));
      } catch (error) {
        emit(AuthFailure('Failed to register: $error'));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final response = await authRepository.login(event.loginRequest);
        emit(AuthSuccess(response));
      } catch (error) {
        emit(AuthFailure('Failed to login: $error'));
      }
    });
  }
}
