import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/design_system/components/fn_text_field.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.emailEditingController, required this.emailFormKey});

  final TextEditingController emailEditingController;
  final GlobalKey<FormState> emailFormKey;

  @override
  Widget build(BuildContext context) {
    return FNTextField(
      formKey: emailFormKey,
      hintText: 'electron_mail_text'.tr(),
      controller: emailEditingController,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (!value!.emailInputIsValid) return 'emil_incorrect_text'.tr();
        return null;
      },
    );
  }
}
