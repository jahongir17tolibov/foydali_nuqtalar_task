import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/design_system/components/foydali_nuqtalar_button.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/register/bloc/register_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, bool>(
      selector: (state) => state.isLoading,
      builder: (context, isLoading) {
        return FoydaliNuqtalarButton(
          onPressed: onPressed,
          contentText: 'register_profile'.tr(),
          isLoading: isLoading,
        );
      },
    );
  }
}
