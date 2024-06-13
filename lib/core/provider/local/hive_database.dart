import 'package:foydali_nuqtalar_task/core/constants/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveConstants.onBoardingBoxName);
    await Hive.openBox(HiveConstants.authBoxName);
  }
}
