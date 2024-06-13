import 'package:easy_localization/easy_localization.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_images.dart';

class DrawerItemModel {
  DrawerItemModel({required this.name, required this.iconAsset, this.appLocale});

  final String name;
  final String iconAsset;
  final String? appLocale;

  DrawerItemModel copyWith({
    String? name,
    String? iconAsset,
    String? appLocale,
  }) =>
      DrawerItemModel(
        name: name ?? this.name,
        iconAsset: iconAsset ?? this.iconAsset,
        appLocale: appLocale ?? this.appLocale,
      );
}

final drawerItemValues = <DrawerItemModel>[
  DrawerItemModel(name: 'theme_mode_text'.tr(), iconAsset: AppImages.moonThemeIcon),
  DrawerItemModel(name: 'app_locale_text'.tr(), iconAsset: '', appLocale: ''),
  DrawerItemModel(name: 'app_info'.tr(), iconAsset: AppImages.infoIcon),
  DrawerItemModel(name: 'video_guide'.tr(), iconAsset: AppImages.playIcon),
];
