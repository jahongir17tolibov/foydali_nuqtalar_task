import 'package:foydali_nuqtalar_task/core/base/use_case.dart';
import 'package:foydali_nuqtalar_task/core/constants/hive_constants.dart';
import 'package:foydali_nuqtalar_task/core/provider/local/hive_local_storage.dart';

class GetCurrentLocaleUseCase implements BaseUseCase<String?> {
  GetCurrentLocaleUseCase({required HiveLocalStorage hiveLocalStorage})
      : _hiveLocalStorage = hiveLocalStorage;

  final HiveLocalStorage _hiveLocalStorage;

  @override
  Future<String?> execute() => _hiveLocalStorage.getString(
        boxName: HiveConstants.onBoardingBoxName,
        key: HiveConstants.changedLangKey,
      );
}
