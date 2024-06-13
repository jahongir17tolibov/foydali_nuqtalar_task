import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/bloc/home_bloc.dart';

class ChangeHomeTextSize extends StatelessWidget {
  const ChangeHomeTextSize({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, double>(
      selector: (state) => state.homeTextSize,
      builder: (context, value) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextView(
                text: 'font_size_text'.tr(),
                textSize: 16.textSize(context),
                textColor: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w500,
              ),
              getHeightSize10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Slider(
                      value: value,
                      min: 8,
                      max: 32,
                      divisions: 24,
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveColor: Colors.grey.withOpacity(0.5),
                      onChanged: (value) {
                        context.read<HomeBloc>().add(OnHomeChangeTextSizeEvent(value));
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextView(
                    text: value.toInt().toString(),
                    textColor: Theme.of(context).colorScheme.onBackground,
                    textSize: 16.textSize(context),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
