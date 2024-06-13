import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_images.dart';
import 'package:foydali_nuqtalar_task/design_system/base_widgets/fn_app_bars.dart';
import 'package:foydali_nuqtalar_task/design_system/components/foydali_nuqtalar_button.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/design_system/extensions/floating_ui.dart';
import 'package:foydali_nuqtalar_task/design_system/theme/app_colors.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/register/register_screen.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/home_screen.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/guide/widget/go_to_you_tube_widget.dart';

import 'cubit/guide_cubit.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  static const String routeName = '/guide';

  static void open(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<GuideCubit>().getAuthToken());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: AppColors.onBoardingColor),
      child: Scaffold(
        appBar: coloredAppBar(context, title: 'video_guide'.tr()),
        backgroundColor: AppColors.onBoardingColor,
        body: BlocBuilder<GuideCubit, GuideState>(
          builder: (context, state) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(AppImages.onBoardingBckgPng, fit: BoxFit.cover),
                ),
                const Align(alignment: Alignment.center, child: GoToYouTubeWidget()),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      state.token == null
                          ? FoydaliNuqtalarButton(
                              onPressed: () {
                                RegisterScreen.open(context);
                              },
                              buttonColor: Theme.of(context).colorScheme.background,
                              contentText: 'enter_profile'.tr(),
                              contentTextColor: Theme.of(context).colorScheme.onBackground,
                            )
                          : TextView(text: state.token!, textSize: 16.textSize(context)),
                      const SizedBox(height: 10),
                      FoydaliNuqtalarButton(
                        onPressed: () {
                          HomeScreen.open(context);
                        },
                        contentText: 'read_book'.tr(),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
