import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/feature/home/presentation/bloc/home_bloc.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, bool>(
      selector: (HomeState state) => state.settingsOpened,
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<HomeBloc>().add(OnHomeSettingsButtonClickEvent());
          },
          icon: Icon(
            Icons.settings_rounded,
            color: state
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onBackground,
          ),
        );
      },
    );
  }
}
