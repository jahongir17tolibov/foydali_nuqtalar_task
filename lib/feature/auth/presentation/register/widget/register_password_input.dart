import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar_task/design_system/components/fn_text_field.dart';
import 'package:foydali_nuqtalar_task/feature/auth/presentation/register/bloc/register_bloc.dart';

class RegisterPasswordInput extends StatelessWidget {
  const RegisterPasswordInput({
    super.key,
    required this.passwordEditingController,
    required this.passwordFormKey,
  });

  final TextEditingController passwordEditingController;
  final GlobalKey<FormState> passwordFormKey;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, bool>(
      selector: (state) => state.passwordObscureState,
      builder: (context, obscureState) {
        return FNTextField.passwordInput(
          formKey: passwordFormKey,
          hintText: 'password_text'.tr(),
          controller: passwordEditingController,
          obscureText: obscureState,
          validator: (value) {
            if (value!.length < 8) return 'Parolning uzunligi 8 tadan kam bo`lmasligi kerak!';
            return null;
          },
          onPressSuffixBtn: () {
            context.read<RegisterBloc>().add(OnRegisterPasswordObscureIconPressedEvent());
          },
        );
      },
    );
  }
}
