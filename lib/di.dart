import 'package:foydali_nuqtalar_task/core/connectivity/connectivity_cubit.dart';
import 'package:foydali_nuqtalar_task/core/provider/local/hive_local_storage.dart';
import 'package:foydali_nuqtalar_task/core/provider/remote/api_client.dart';
import 'package:foydali_nuqtalar_task/feature/auth/data/remote/auth_remote_data_source.dart';
import 'package:foydali_nuqtalar_task/feature/auth/data/remote/source/auth_remote_data_source_impl.dart';
import 'package:foydali_nuqtalar_task/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/repository/auth_repository.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/use_case/get_users_auth_state_use_case.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/use_case/login_as_user_use_case.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/use_case/register_as_user_use_case.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/login/bloc/login_bloc.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/register/bloc/register_bloc.dart';
import 'package:foydali_nuqtalar_task/feature/home/data/remote/remote_data_source.dart';
import 'package:foydali_nuqtalar_task/feature/home/domain/use_case/get_books_content_use_case.dart';
import 'package:foydali_nuqtalar_task/feature/home/domain/use_case/get_current_locale_use_case.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/bloc/home_bloc.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/change_lang/cubit/change_lang_cubit.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/guide/cubit/guide_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt get getIt => GetIt.instance;

Future<void> initDependencies() async {
  getIt
    ..registerLazySingleton<HiveLocalStorage>(HiveLocalStorage.new)
    ..registerLazySingleton<ApiClient>(ApiClient.new)
    ..registerSingleton<ConnectivityCubit>(
      ConnectivityCubit(),
      dispose: (connectivityCubit) {
        connectivityCubit.dispose();
      },
    )

    /// on boarding
    ..registerFactory<ChangeLangCubit>(
        () => ChangeLangCubit(hiveLocalStorage: getIt<HiveLocalStorage>()))
    ..registerFactory<GuideCubit>(() => GuideCubit(getUsersAuthState: getIt<GetUsersAuthState>()))

    /// auth
    ..registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(apiClient: getIt<ApiClient>()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
          remoteDataSource: getIt<AuthRemoteDataSource>(),
          hiveLocalStorage: getIt<HiveLocalStorage>(),
        ))
    ..registerFactory<GetUsersAuthState>(
        () => GetUsersAuthState(hiveLocalStorage: getIt<HiveLocalStorage>()))
    ..registerFactory<RegisterAsUserUseCase>(
        () => RegisterAsUserUseCase(authRepository: getIt<AuthRepository>()))
    ..registerFactory<LoginAsUserUseCase>(
        () => LoginAsUserUseCase(authRepository: getIt<AuthRepository>()))
    ..registerFactory(() => LoginBloc(
          loginAsUserUseCase: getIt<LoginAsUserUseCase>(),
        ))
    ..registerFactory<RegisterBloc>(() => RegisterBloc(
          registerAsUserUseCase: getIt<RegisterAsUserUseCase>(),
        ))

    ///home
    ..registerLazySingleton(() => RemoteDataSource(client: getIt<ApiClient>()))
    ..registerFactory(
        () => GetBooksContentResultUseCase(remoteDataSource: getIt<RemoteDataSource>()))
    ..registerFactory<GetCurrentLocaleUseCase>(
        () => GetCurrentLocaleUseCase(hiveLocalStorage: getIt<HiveLocalStorage>()))
    ..registerFactory<HomeBloc>(() => HomeBloc(
          getCurrentLocaleUseCase: getIt<GetCurrentLocaleUseCase>(),
          getUsersAuthState: getIt<GetUsersAuthState>(),
          getBooksContentResultUseCase: getIt<GetBooksContentResultUseCase>(),
        ));
}
