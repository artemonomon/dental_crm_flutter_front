import 'package:dental_crm_flutter_front/repositories/auth/models/models.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<RegistrationResponse> register(RegistrationRequest request) async {
    try {
      final response = await _dio.post(
        'https://dental-crm-go-back-production.up.railway.app/api/v1/auth/register',
        data: request.toJson(),
      );
      final registrationResponse = RegistrationResponse.fromJson(response.data);

      return registrationResponse;
    } catch (error) {
      throw Exception('Failed to register: $error');
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        'https://dental-crm-go-back-production.up.railway.app/api/v1/auth/login',
        data: request.toJson(),
      );
      final loginResponse = LoginResponse.fromJson(response.data);

      return loginResponse;
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }

  // Future<bool> checkAuthStatus() async {
  //   final token = await TokenManager.getToken();
  //   // Перевірка статусу авторизації за наявності токену
  //   return token.isNotEmpty;
  // }
  // Future<User> register(String email, String password) async {
  //   try {
  //     Response response = await _dio.post(
  //       'https://app-sqlite-aiy3mtkmhq-lm.a.run.app/api/v1/auth/register',
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );
  //     return User.fromJson(response.data);
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  // Future<User> login(String email, String password) async {
  //   try {
  //     Response response = await _dio.post(
  //       'https://app-sqlite-aiy3mtkmhq-lm.a.run.app/api/v1/auth/login',
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );
  //     return User.fromJson(response.data);
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
}
