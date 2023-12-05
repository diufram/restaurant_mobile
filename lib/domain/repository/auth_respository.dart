import '../models/user.dart';
import '../request/login_request.dart';
import '../request/register_request.dart';
import '../response/login_response.dart';
import '../response/register_response.dart';

abstract class AuthRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<RegisterResponse> register(RegisterRequest register);
  Future<void> logout(String token);
}
