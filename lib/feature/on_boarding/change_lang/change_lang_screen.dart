import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_images.dart';
import 'package:foydali_nuqtalar_task/design_system/base_widgets/fn_app_bars.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/change_lang/widget/continue_button.dart';

import 'widget/change_lang_item.dart';

class ChangeLangScreen extends StatefulWidget {
  const ChangeLangScreen({super.key, required this.isFirstTime});

  final bool isFirstTime;

  static const String routeName = '/change_lang';

  static void openReplacement(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: true);
  }

  static void open(BuildContext context, {VoidCallback? extraAction}) async {
    await Navigator.of(context).pushNamed(routeName, arguments: false).whenComplete(() {
      extraAction?.call();
    });
  }

  @override
  State<ChangeLangScreen> createState() => _ChangeLangScreenState();
}

class _ChangeLangScreenState extends State<ChangeLangScreen> {
  List<Map<String, String>> languages = [];

  @override
  void initState() {
    languages = const [
      {
        'name': 'O‘zbek tili',
        'asset': AppImages.uzbFlagSvg,
      },
      {
        'name': 'Русский',
        'asset': AppImages.russiaFlagSvg,
      },
      {
        'name': 'English',
        'asset': AppImages.usaFlagSvg,
      },
      {
        'name': 'Français',
        'asset': AppImages.franceFlagSvg,
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, title: 'change_lang'.tr(), backIsDisabled: widget.isFirstTime),
      body: Column(
        children: <Widget>[
          ...List.generate(languages.length, (index) {
            final item = languages[index];
            return ChangeLangItem(
              name: item['name'] as String,
              svgAsset: item['asset'] as String,
            );
          }),
          const Spacer(),
          Visibility(visible: widget.isFirstTime, child: const ContinueButton()),
        ],
      ),
    );
  }
}
