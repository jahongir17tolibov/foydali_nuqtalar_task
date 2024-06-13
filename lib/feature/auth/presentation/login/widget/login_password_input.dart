import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/design_system/components/fn_text_field.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/login/bloc/login_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.passwordEditingController,
    required this.passwordFormKey,
  });

  final TextEditingController passwordEditingController;
  final GlobalKey<FormState> passwordFormKey;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, bool>(
      selector: (state) => state.passwordObscureState,
      builder: (context, obscureState) {
        return FNTextField.passwordInput(
          formKey: passwordFormKey,
          hintText: 'password_text'.tr(),
          controller: passwordEditingController,
          obscureText: obscureState,
          validator: (value) {
            if (value!.length < 8) return 'pass_length_text'.tr();
            return null;
          },
          onPressSuffixBtn: () {
            context.read<LoginBloc>().add(OnLoginPasswordObscureIconPressedEvent());
          },
        );
      },
    );
  }
}
