import 'package:foydali_nuqtalar_task/feature/auth/data/remote/dto/auth_dto.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/entity/auth_model.dart';

extension AuthDtoMapper on AuthDto {
  AuthModel get toAuthModel => AuthModel(
        fullName: fullName ?? '',
        email: email ?? '',
        password: password ?? '',
      );
}

extension AuthModelMapper on AuthModel {
  AuthDto get toAuthModel => AuthDto(fullName: fullName, email: email, password: password);
}
