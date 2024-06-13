import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/design_system/theme/app_colors.dart';

AppBar defaultAppBar(BuildContext context, {required String title, bool backIsDisabled = true}) =>
    AppBar(
      title: TextView(
        text: title,
        textColor: Theme.of(context).colorScheme.onBackground,
      ),
      automaticallyImplyLeading: !backIsDisabled,
      centerTitle: true,
    );

AppBar coloredAppBar(
  BuildContext context, {
  required String title,
  Color backgroundColor = AppColors.onBoardingColor,
}) =>
    AppBar(
      title: TextView(
        text: title,
        textColor: Theme.of(context).colorScheme.onBackground,
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: backgroundColor,
    );
