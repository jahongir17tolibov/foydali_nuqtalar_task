import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/design_system/theme/app_colors.dart';

final ThemeData appLightTheme = ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: AppColors.appLightColorScheme,
  scaffoldBackgroundColor: AppColors.backgroundColorLight,
);

final ThemeData appDarkTheme = ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: AppColors.appDarkColorScheme,
  scaffoldBackgroundColor: AppColors.backgroundColorDark,
);
