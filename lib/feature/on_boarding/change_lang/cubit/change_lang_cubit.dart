import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar_task/core/constants/hive_constants.dart';
import 'package:foydali_nuqtalar_task/core/provider/local/hive_local_storage.dart';

part 'change_lang_state.dart';

class ChangeLangCubit extends Cubit<ChangeLangState> {
  ChangeLangCubit({required this.hiveLocalStorage}) : super(const ChangeLangState());

  final HiveLocalStorage hiveLocalStorage;

  FutureOr<void> onSelectLanguage(String selectedLang) async {
    await hiveLocalStorage
        .saveString(
      boxName: HiveConstants.onBoardingBoxName,
      key: HiveConstants.changedLangKey,
      value: selectedLang,
    ).whenComplete(() {
      emit(ChangeLangState(selectedLang: selectedLang));
    });
  }
}
