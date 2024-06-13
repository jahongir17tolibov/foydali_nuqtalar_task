import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';

class HomeStyleButton extends StatelessWidget {
  const HomeStyleButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    this.isChecked = 0,
    required this.index,
    required this.changedTextSize,
    required this.onPressed,
  });

  final int index;
  final Color buttonColor;
  final Color textColor;
  final int isChecked;
  final double changedTextSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: isChecked == index
                  ? BorderSide(color: Theme.of(context).colorScheme.primary)
                  : BorderSide(color: Colors.grey.withOpacity(0.5)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextView(text: 'Aa', textSize: 18.textSize(context), textColor: textColor),
              getWidthSize4,
              Visibility(
                visible: isChecked == index,
                child: Icon(
                  Icons.check_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
