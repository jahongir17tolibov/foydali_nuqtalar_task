import 'package:foydali_nuqtalar_task/core/base/result_handle.dart';
import 'package:foydali_nuqtalar_task/feature/auth/data/remote/dto/auth_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<Result<AuthDto>> registerUser(String fullName, String email, String password);

  Future<Result<AuthDto>> loginUser(String email, String password);
}
