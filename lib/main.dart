import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foydali_nuqtalar_task/core/provider/local/hive_database.dart';
import 'package:foydali_nuqtalar_task/design_system/components/custom_native_splash.dart';
import 'package:foydali_nuqtalar_task/di.dart';

import 'app/my_app.dart';
import 'core/constants/app_constants.dart';
import 'core/localization/app_localizations.dart';

void main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  CustomNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();
  await HiveDatabase.init();
  await initDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).whenComplete(() {
    runApp(
      EasyLocalization(
        supportedLocales: AppLocalization.values,
        path: AppConstants.localizationsPath,
        fallbackLocale: AppLocalization.uzLocale,
        saveLocale: true,
        child: const MyApp(),
      ),
    );
  });
}
