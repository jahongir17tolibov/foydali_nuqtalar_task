import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/design_system/components/google_font_style.dart';

class FNTextField extends StatelessWidget {
  const FNTextField({
    super.key,
    required this.formKey,
    required this.hintText,
    required this.controller,
    this.focusNode,
    required this.textInputType,
    this.validator,
  })  : obscureText = false,
        onPressSuffixBtn = null;

  const FNTextField.passwordInput({
    super.key,
    required this.formKey,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.validator,
    required this.obscureText,
    required this.onPressSuffixBtn,
  }) : textInputType = TextInputType.visiblePassword;

  final GlobalKey<FormState> formKey;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final VoidCallback? onPressSuffixBtn;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        validator: (value) {
          if (value == null || value.isEmpty) return 'field_empty_text'.tr();
          return validator?.call(value);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Theme.of(context).colorScheme.primary,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
        cursorOpacityAnimates: true,
        style: googleFontStyle(
          fontSize: 16.textSize(context),
          fontColor: Theme.of(context).colorScheme.onBackground,
        ),
        textCapitalization: (textInputType == TextInputType.name)
            ? TextCapitalization.sentences
            : TextCapitalization.none,
        obscureText: obscureText,
        cursorErrorColor: Theme.of(context).colorScheme.error,
        decoration: InputDecoration(
          enabled: true,
          hintText: hintText,
          hintStyle: googleFontStyle(fontSize: 16.textSize(context)),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          suffixIcon: textInputType == TextInputType.visiblePassword
              ? IconButton(
                  onPressed: onPressSuffixBtn,
                  icon: Icon(
                    !obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : null,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 4),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 4),
          ),
        ),
      ),
    );
  }
}
