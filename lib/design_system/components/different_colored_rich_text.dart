import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/core/base/base_extensions.dart';

import 'google_font_style.dart';

class DifferentColoredRichText extends StatelessWidget {
  const DifferentColoredRichText({
    super.key,
    required this.leftText,
    required this.leftTextColor,
    required this.rightText,
    required this.rightTextColor,
    this.textSize,
  });

  final String leftText;
  final Color leftTextColor;
  final String rightText;
  final Color rightTextColor;
  final double? textSize;

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          text: leftText,
          style: googleFontStyle(
            fontColor: leftTextColor,
            fontSize: textSize ?? 16.textSize(context),
          ),
          children: <TextSpan>[
            TextSpan(
              text: rightText,
              style: googleFontStyle(
                fontColor: rightTextColor,
                fontSize: textSize ?? 16.textSize(context),
              ),
            )
          ],
        ),
      );
}
