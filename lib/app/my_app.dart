import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/core/connectivity/connectivity_cubit.dart';
import 'package:foydali_nuqtalar_task/core/navigation/navigation_router.dart';
import 'package:foydali_nuqtalar_task/design_system/theme/theme.dart';
import 'package:foydali_nuqtalar_task/di.dart';
import 'package:foydali_nuqtalar_task/feature/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>(
          create: (_) => getIt<ConnectivityCubit>()..observeConnectivity(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: appLightTheme,
        darkTheme: appLightTheme,
        onGenerateRoute: NavigationRouter.generateRoute,
        initialRoute: SplashScreen.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
