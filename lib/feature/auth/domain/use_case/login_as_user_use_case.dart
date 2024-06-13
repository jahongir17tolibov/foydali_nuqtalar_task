import 'package:foydali_nuqtalar_task/feature/auth/domain/repository/auth_repository.dart';

class LoginAsUserUseCase {
  LoginAsUserUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<RegisterResult> execute(String email, String password) =>
      _authRepository.loginAsUser(email, password);
}
