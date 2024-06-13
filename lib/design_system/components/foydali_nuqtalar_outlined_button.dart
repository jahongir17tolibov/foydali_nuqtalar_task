import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';
import 'package:foydali_nuqtalar_task/design_system/components/scale_on_press_button.dart';
import 'package:foydali_nuqtalar_task/design_system/components/text_view.dart';

class FoydaliNuqtalarOutlinedButton extends StatelessWidget {
  const FoydaliNuqtalarOutlinedButton({
    super.key,
    required this.onPressed,
    required this.contentText,
    required this.icon,
  });

  final VoidCallback onPressed;
  final String contentText;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          fixedSize: Size(1.screenWidth(context), 0.065.screenHeight(context)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          splashFactory: NoSplash.splashFactory,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(icon, fit: BoxFit.cover),
            const SizedBox(width: 6),
            TextView(
              text: contentText,
              textColor: Theme.of(context).colorScheme.onBackground,
              textSize: 16.textSize(context),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
