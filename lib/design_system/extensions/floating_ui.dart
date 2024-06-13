import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';

extension ModalPopUps on BuildContext {
  void showModalPopUp(Widget child) {
    showCupertinoModalPopup<void>(
      context: this,
      builder: (context) => Container(
        height: 0.6.screenWidth(this),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: Theme.of(context).colorScheme.surface.withOpacity(0.99),
        child: SafeArea(top: false, child: SafeArea(top: false, child: child)),
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: TextView(
            text: message,
            textColor: Theme.of(this).colorScheme.background,
            maxLines: 3,
            textOverflow: TextOverflow.fade,
          ),
          backgroundColor: Theme.of(this).colorScheme.onBackground.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(this).colorScheme.secondaryContainer,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
  }
}
