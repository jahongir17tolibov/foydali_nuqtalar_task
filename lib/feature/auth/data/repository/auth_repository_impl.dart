import 'dart:async';

import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';
import 'package:foydali_nuqtalar_task/core/constants/hive_constants.dart';
import 'package:foydali_nuqtalar_task/core/provider/local/hive_local_storage.dart';
import 'package:foydali_nuqtalar_task/feature/auth/data/remote/auth_remote_data_source.dart';
import 'package:foydali_nuqtalar_task/feature/auth/data/repository/mapper/auth_mapper.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required HiveLocalStorage hiveLocalStorage,
  })  : _remoteDataSource = remoteDataSource,
        _hiveLocalStorage = hiveLocalStorage;

  final AuthRemoteDataSource _remoteDataSource;
  final HiveLocalStorage _hiveLocalStorage;

  @override
  Future<LoginResult> loginAsUser(String email, String password) {
    return _remoteDataSource.loginUser(email, password).then((result) async {
      if (result.data != null) {
        await _saveAuthToken(result.data!.email!); /* aslida token qaytarilishi kerak edi*/
        return LoginResult(data: result.data!.toAuthModel);
      }
      return LoginResult(errorMessage: result.errorMessage);
    });
  }

  @override
  Future<RegisterResult> registerAsUser(String fullName, String email, String password) {
    return _remoteDataSource.registerUser(fullName, email, password).then((result) async {
      if (result.data != null) {
        printOnDebug("repo: ${result.data!.email}");
        await _saveAuthToken(result.data!.email!); /* aslida token qaytarilishi kerak edi */
        return RegisterResult(data: result.data!.toAuthModel);
      }
      return RegisterResult(errorMessage: result.errorMessage);
    });
  }

  FutureOr<void> _saveAuthToken(String token) async {
    await _hiveLocalStorage
        .getString(boxName: HiveConstants.authBoxName, key: HiveConstants.authKey)
        .then((value) async {
      if (value != null) {
        await _hiveLocalStorage.deleteString(
          boxName: HiveConstants.authBoxName,
          key: HiveConstants.authKey,
        );
      }
      await _hiveLocalStorage.saveString(
        boxName: HiveConstants.authBoxName,
        key: HiveConstants.authKey,
        value: token,
      );
    });
  }
}
// + loginda qanday qiymat kiritmy 401 code qaytaryapti(( */
