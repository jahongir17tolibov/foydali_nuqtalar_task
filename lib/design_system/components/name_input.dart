import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/design_system/components/fn_text_field.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key, required this.nameEditingController, required this.nameFormKey});

  final TextEditingController nameEditingController;
  final GlobalKey<FormState> nameFormKey;

  @override
  Widget build(BuildContext context) {
    return FNTextField(
      formKey: nameFormKey,
      hintText: 'name_text'.tr(),
      controller: nameEditingController,
      textInputType: TextInputType.name,
    );
  }
}
