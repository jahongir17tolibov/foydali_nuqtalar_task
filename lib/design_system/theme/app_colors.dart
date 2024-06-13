import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const onBoardingColor = Color(0xFFFEF4F0);

  /// light colors
  static const backgroundColorLight = Color(0xFFFFFFFF);
  static const onBackgroundColorLight = Color(0xFF010A27);
  static const primaryColorLight = Color(0xFFF07448);
  static const primaryColorContainerLight = Color(0xFFF07448);
  static const onPrimaryColorLight = Color(0xFFF5EDEB);
  static const secondaryColorLight = Color(0xFFF9F2E2);
  static const errorColorLight = Color(0xFFB3261E);

  static const ColorScheme appLightColorScheme = ColorScheme.light(
      brightness: Brightness.light,
      primary: primaryColorLight,
      onPrimary: onPrimaryColorLight,
      primaryContainer: primaryColorContainerLight,
      background: backgroundColorLight,
      onBackground: onBackgroundColorLight,
      secondary: secondaryColorLight,
      error: errorColorLight);

  /// dark colors
  static const backgroundColorDark = Color(0xFF010A27);
  static const onBackgroundColorDark = Color(0xFFFFFFFF);
  static const primaryColorDark = Color(0xFFF07448);
  static const primaryColorContainerDark = Color(0xFFF07448);
  static const onPrimaryColorDark = Color(0xFFF5EDEB);
  static const secondaryColorDark = Color(0xFFF9F2E2);
  static const errorColorDark = Color(0xFFF07448);

  static const ColorScheme appDarkColorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: primaryColorDark,
    onPrimary: onPrimaryColorDark,
    primaryContainer: primaryColorContainerDark,
    background: backgroundColorDark,
    onBackground: onBackgroundColorDark,
    secondary: secondaryColorDark,
    error: errorColorDark,
  );
}
