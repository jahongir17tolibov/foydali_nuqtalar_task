import 'package:foydali_nuqtalar_task/feature/auth/domain/repository/auth_repository.dart';

class RegisterAsUserUseCase {
  RegisterAsUserUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<RegisterResult> execute(String fullName, String email, String password) =>
      _authRepository.registerAsUser(fullName, email, password);
}
