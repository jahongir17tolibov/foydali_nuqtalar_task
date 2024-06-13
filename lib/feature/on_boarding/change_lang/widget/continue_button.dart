import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/design_system/components/foydali_nuqtalar_button.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/change_lang/cubit/change_lang_cubit.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/guide/guide_screen.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChangeLangCubit, ChangeLangState, String?>(
      selector: (state) => state.selectedLang,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: FoydaliNuqtalarButton(
            onPressed: state != null
                ? () {
                    GuideScreen.open(context);
                  }
                : null,
            contentText: 'continue'.tr(),
          ),
        );
      },
    );
  }
}
