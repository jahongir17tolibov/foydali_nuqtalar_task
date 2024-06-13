import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/di.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/login/bloc/login_bloc.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/login/login_screen.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/register/bloc/register_bloc.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/register/register_screen.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/bloc/home_bloc.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/home_screen.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/change_lang/change_lang_screen.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/change_lang/cubit/change_lang_cubit.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/guide/cubit/guide_cubit.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/guide/guide_screen.dart';
import 'package:foydali_nuqtalar_task/feature/splash/splash_screen.dart';

class NavigationRouter {
  NavigationRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return _materialNavigate(const SplashScreen());

      case ChangeLangScreen.routeName:
        {
          final bool arguments = settings.arguments as bool;
          return _materialNavigate(
            BlocProvider(
              create: (_) => getIt<ChangeLangCubit>(),
              child: ChangeLangScreen(isFirstTime: arguments),
            ),
          );
        }

      case GuideScreen.routeName:
        return _cupertinoNavigate(BlocProvider(
          create: (_) => getIt<GuideCubit>(),
          child: const GuideScreen(),
        ));

      case LoginScreen.routeName:
        return _materialNavigate(BlocProvider(
          create: (_) => getIt<LoginBloc>(),
          child: const LoginScreen(),
        ));

      case RegisterScreen.routeName:
        return _materialNavigate(BlocProvider(
          create: (_) => getIt<RegisterBloc>(),
          child: const RegisterScreen(),
        ));

      case HomeScreen.routeName:
        return _materialNavigate(BlocProvider(
          create: (_) => getIt<HomeBloc>(),
          child: const HomeScreen(),
        ));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _materialNavigate(Widget screen) =>
      MaterialPageRoute(builder: (_) => screen);

  static Route<dynamic> _cupertinoNavigate(Widget screen) =>
      CupertinoPageRoute(builder: (_) => screen);
}
