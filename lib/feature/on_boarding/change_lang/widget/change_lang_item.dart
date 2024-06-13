import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/localization/app_localizations.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';
import 'package:foydali_nuqtalar_task/feature/on_boarding/change_lang/cubit/change_lang_cubit.dart';

class ChangeLangItem extends StatelessWidget {
  const ChangeLangItem({super.key, required this.name, required this.svgAsset});

  final String name;
  final String svgAsset;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChangeLangCubit, ChangeLangState, String?>(
      selector: (state) => state.selectedLang,
      builder: (context, selectedLang) {
        return ListTile(
          onTap: () async {
            await context.setLocale(_getLocaleByText()).whenComplete(() {
              context.read<ChangeLangCubit>().onSelectLanguage(name);
            });
          },
          title: TextView(
            text: name,
            textSize: 16.textSize(context),
            textColor: Theme.of(context).colorScheme.onBackground,
            fontWeight: selectedLang == name ? FontWeight.bold : null,
          ),
          leading: SvgPicture.asset(
            svgAsset,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
          tileColor: selectedLang == name
              ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.15)
              : null,
          trailing: selectedLang == name
              ? Icon(Icons.check_rounded, color: Theme.of(context).colorScheme.primary)
              : null,
        );
      },
    );
  }

  Locale _getLocaleByText() {
    debugPrint('lang: $name');
    if (name == "O‘zbek tili") {
      return AppLocalization.uzLocale;
    } else if (name == "Русский") {
      return AppLocalization.ruLocale;
    } else if (name == "English") {
      return AppLocalization.enLocale;
    } else if (name == "Français") {
      return AppLocalization.frLocale;
    }
    return AppLocalization.uzLocale;
  }
}
