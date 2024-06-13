import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/design_system/components/scale_on_press_button.dart';

class HomeSideButton extends StatelessWidget {
  const HomeSideButton({
    super.key,
    required this.isChecked,
    required this.child,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final bool isChecked;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: isChecked
                ? BorderSide(color: Theme.of(context).colorScheme.primary)
                : BorderSide.none,
          ),
          splashFactory: NoSplash.splashFactory,
        ),
        child: child,
      ),
    );
  }
}
