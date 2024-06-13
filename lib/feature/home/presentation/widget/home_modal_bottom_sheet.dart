import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';
import 'package:foydali_nuqtalar_task/feature/home/domain/entity/home_style_model.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/bloc/home_bloc.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/widget/change_font_size.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/widget/change_home_font_family.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/widget/home_style_widget.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/widget/home_text_align_changed.dart';

class HomeModalBottomSheet extends StatelessWidget {
  const HomeModalBottomSheet({
    super.key,
    required this.homeStylesList,
    required this.checkedIndex,
    required this.changedTextSize,
  });

  final List<HomeStyleModel> homeStylesList;
  final int checkedIndex;
  final double changedTextSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...List.generate(homeStylesList.length, (index) {
                  final item = homeStylesList[index];
                  return HomeStyleButton(
                    buttonColor: item.buttonColor,
                    textColor: item.textColor,
                    index: index,
                    isChecked: checkedIndex,
                    changedTextSize: changedTextSize,
                    onPressed: () {
                      context.read<HomeBloc>().add(OnHomeStyleButtonChangedEvent(
                            homeStyleModel: homeStylesList[index],
                            index: index,
                          ));
                    },
                  );
                }),
              ],
            ),
          ),
          getOpacityDivider,
          const ChangeHomeTextSize(),
          getOpacityDivider,
          const ChangeHomeFontFamily(),
          getOpacityDivider,
          const HomeTextAlignChanged(),
        ],
      ),
    );
  }
}
