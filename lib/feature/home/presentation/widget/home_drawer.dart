import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_constants.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_images.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/bloc/home_bloc.dart';

import 'drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 0.85.screenWidth(context),
      child: BlocSelector<HomeBloc, HomeState, String?>(
        selector: (state) => state.currentLocale,
        builder: (context, currentLocale) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _brandName(context, 'FOYDALI'),
                    getWidthSize4,
                    Image.asset(AppImages.appIcon, width: 48, height: 48, fit: BoxFit.cover),
                    getWidthSize4,
                    _brandName(context, 'NUQTALAR'),
                  ],
                ),
              ),
              DrawerItem(text: 'theme_mode_text'.tr(), iconAsset: AppImages.moonThemeIcon),
              DrawerItem(
                text: 'app_locale_text'.tr(),
                iconAsset: _getAssetByLocale(currentLocale ?? ''),
                localization: currentLocale,
              ),
              DrawerItem(text: 'app_info'.tr(), iconAsset: AppImages.infoIcon),
              DrawerItem(text: 'video_guide'.tr(), iconAsset: AppImages.playIcon),
            ],
          );
        },
      ),
    );
  }

  Widget _brandName(BuildContext context, String text) => TextView.boldStyle(
        text: text,
        textColor: Theme.of(context).colorScheme.onBackground,
        textSize: 20.textSize(context),
        fontFamily: AppConstants.brandFontFamily,
      );

  String _getAssetByLocale(String name) {
    if (name == "O‘zbek tili") {
      return AppImages.uzbFlagSvg;
    } else if (name == "Русский") {
      return AppImages.russiaFlagSvg;
    } else if (name == "English") {
      return AppImages.usaFlagSvg;
    } else if (name == "Français") {
      return AppImages.franceFlagSvg;
    }
    return AppImages.uzbFlagSvg;
  }
}
