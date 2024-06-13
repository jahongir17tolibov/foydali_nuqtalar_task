import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar_task/core/constants/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle googleFontStyle({
  String? font,
  double? fontSize,
  Color? fontColor,
  FontWeight? fontWeight = FontWeight.normal,
  FontStyle? fontStyle,
  TextDecoration? decoration,
}) =>
    GoogleFonts.getFont(
      font ?? AppConstants.appFontFamily,
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
    );
