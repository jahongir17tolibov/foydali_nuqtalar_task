import 'package:foydali_nuqtalar_task/core/base/result_handle.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/entity/auth_model.dart';

typedef RegisterResult = Result<AuthModel>;
typedef LoginResult = Result<AuthModel>;

abstract interface class AuthRepository {
  Future<RegisterResult> registerAsUser(String fullName, String email, String password);

  Future<LoginResult> loginAsUser(String email, String password);
}
