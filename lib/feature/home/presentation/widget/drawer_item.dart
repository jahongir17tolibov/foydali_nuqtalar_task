import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/bloc/home_bloc.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/change_lang/change_lang_screen.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.iconAsset,
    required this.text,
    this.localization,
  });

  final String iconAsset;
  final String text;
  final String? localization;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (localization != null) {
          ChangeLangScreen.open(context, extraAction: () {
            context.read<HomeBloc>().add(OnHomeRefreshEvent());
          });
        }
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  iconAsset,
                  colorFilter: localization == null
                      ? ColorFilter.mode(
                          Theme.of(context).colorScheme.onBackground,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
                const SizedBox(width: 10),
                TextView(
                  text: text,
                  textColor: Theme.of(context).colorScheme.onBackground,
                  textSize: 16.textSize(context),
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                Visibility(
                  visible: localization != null,
                  child: TextView(
                    text: localization.toString(),
                    textSize: 16.textSize(context),
                    textColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
        ],
      ),
    );
  }
}
