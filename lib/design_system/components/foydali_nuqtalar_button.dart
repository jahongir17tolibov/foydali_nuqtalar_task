import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/design_system/components/scale_on_press_button.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';

class FoydaliNuqtalarButton extends StatelessWidget {
  const FoydaliNuqtalarButton({
    super.key,
    required this.onPressed,
    this.buttonColor,
    required this.contentText,
    this.contentTextColor,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final Color? buttonColor;
  final String contentText;
  final Color? contentTextColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      isDisabled: onPressed == null,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: buttonColor ?? Theme.of(context).colorScheme.primary,
          fixedSize: Size(1.screenWidth(context), 0.065.screenHeight(context)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          splashFactory: NoSplash.splashFactory,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextView(
              text: contentText,
              textColor: contentTextColor ?? Theme.of(context).colorScheme.onPrimary,
              textSize: 16.textSize(context),
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(width: 8),
            Visibility(
              visible: isLoading,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: contentTextColor ?? Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
