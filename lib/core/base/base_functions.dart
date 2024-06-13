import 'package:flutter/material.dart';

void printOnDebug(String value) {
  debugPrint("------------------\n$value\n------------------");
}

Widget get getWidthSize4 => const SizedBox(width: 4);

Widget get getHeightSize4 => const SizedBox(height: 4);

Widget get getWidthSize10 => const SizedBox(width: 10);

Widget get getHeightSize10 => const SizedBox(height: 10);

Widget get getDivider => const Divider(color: Colors.grey);

Widget get getOpacityDivider => Divider(color: Colors.grey.withOpacity(0.5));
