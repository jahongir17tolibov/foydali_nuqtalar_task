import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_constants.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/bloc/home_bloc.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/widget/home_side_button.dart';

class ChangeHomeFontFamily extends StatelessWidget {
  const ChangeHomeFontFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, String>(
      selector: (state) => state.homeFontFamily,
      builder: (context, selectedFont) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextView(
                text: 'font_text'.tr(),
                textColor: Theme.of(context).colorScheme.onBackground,
                textSize: 16.textSize(context),
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              HomeSideButton(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(OnHomeChangeFontFamilyEvent(AppConstants.appFontFamily));
                },
                isChecked: selectedFont == AppConstants.appFontFamily,
                child: TextView(
                  text: AppConstants.appFontFamily,
                  textSize: 16.textSize(context),
                  textColor: selectedFont == AppConstants.appFontFamily
                      ? Theme.of(context).colorScheme.onBackground
                      : Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
              getWidthSize4,
              HomeSideButton(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(OnHomeChangeFontFamilyEvent(AppConstants.extraFontFamily));
                },
                isChecked: selectedFont == AppConstants.extraFontFamily,
                child: TextView(
                  text: AppConstants.extraFontFamily,
                  textSize: 16.textSize(context),
                  textColor: selectedFont == AppConstants.extraFontFamily
                      ? Theme.of(context).colorScheme.onBackground
                      : Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontFamily: AppConstants.extraFontFamily,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
