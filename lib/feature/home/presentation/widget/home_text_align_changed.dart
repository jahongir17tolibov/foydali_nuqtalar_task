import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/bloc/home_bloc.dart';

import 'home_side_button.dart';

class HomeTextAlignChanged extends StatelessWidget {
  const HomeTextAlignChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, bool>(
      selector: (state) => state.homeTextAlign,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextView(
                text: 'text_align_style_text'.tr(),
                textColor: Theme.of(context).colorScheme.onBackground,
                textSize: 16.textSize(context),
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              HomeSideButton(
                onPressed: () {
                  context.read<HomeBloc>().add(OnHomeChangeTextAlignEvent());
                },
                isChecked: state,
                child: Icon(
                  Icons.format_align_justify_rounded,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              getWidthSize4,
              HomeSideButton(
                onPressed: () {
                  context.read<HomeBloc>().add(OnHomeChangeTextAlignEvent());
                },
                isChecked: !state,
                child: Icon(
                  Icons.format_align_left_rounded,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
