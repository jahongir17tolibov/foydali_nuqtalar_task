import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_constants.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_images.dart';
import 'package:foydali_nuqtalar_task/core/constants/hive_constants.dart';
import 'package:foydali_nuqtalar_task/core/provider/local/hive_local_storage.dart';
import 'package:foydali_nuqtalar_task/design_system/components/custom_native_splash.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/di.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/login/login_screen.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/home_screen.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/change_lang/change_lang_screen.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/guide/guide_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  static void open(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.microtask(() => _initSplash());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AppImages.appIcon,
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 6),
            TextView.boldStyle(
              text: 'FOYDALI\nNUQTALAR',
              textSize: 32.textSize(context),
              textColor: Theme.of(context).colorScheme.onBackground,
              textAlign: TextAlign.center,
              fontFamily: AppConstants.brandFontFamily,
            ),
            TextView(
              text: 'SHUXRAT XO‘JA',
              textColor: Colors.grey,
              textSize: 16.textSize(context),
            ),
          ],
        ),
      ),
    );
  }

  void _initSplash() {
    CustomNativeSplash.remove();
    Future.delayed(const Duration(seconds: 2), () async {
      await getIt<HiveLocalStorage>()
          .getString(boxName: HiveConstants.onBoardingBoxName, key: HiveConstants.changedLangKey)
          .then((value) async {
        if (value == null) {
          ChangeLangScreen.openReplacement(context);
        } else {
          GuideScreen.open(context);
        }
      });
    });
  }
}
